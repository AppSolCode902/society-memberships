import { Hono } from "hono";

const app = new Hono();

// ===================================================================
//  Helpers
// ===================================================================

function getUserEmail(c) {
  return c.req.header("Cf-Access-Authenticated-User-Email") || "unknown";
}

async function logAudit(db, { userEmail, action, entityType, entityId, oldValues, newValues, summary }) {
  await db.prepare(
    `INSERT INTO audit_log (user_email, action, entity_type, entity_id, old_values, new_values, summary)
     VALUES (?, ?, ?, ?, ?, ?, ?)`
  ).bind(
    userEmail || "unknown",
    action,
    entityType,
    entityId ?? null,
    oldValues ? JSON.stringify(oldValues) : null,
    newValues ? JSON.stringify(newValues) : null,
    summary || null
  ).run();
}

// ===================================================================
//  Health + reference data
// ===================================================================
app.get("/api/health", (c) => c.json({ ok: true }));

app.get("/api/membership-types", async (c) => {
  const { results } = await c.env.DB.prepare(
    "SELECT type, annual_fee_cents FROM membership_types ORDER BY annual_fee_cents"
  ).all();
  return c.json(results);
});

// ===================================================================
//  Members
// ===================================================================
app.get("/api/members", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT m.member_id, m.first_name, m.last_name, m.email,
            m.city, m.province, m.is_payer, m.date_joined,
            ms.membership_id, ms.type AS membership_type,
            ms.next_due_date, ms.active AS membership_active
       FROM members m
       LEFT JOIN memberships ms ON ms.membership_id = m.membership_id
      ORDER BY m.last_name, m.first_name`
  ).all();
  return c.json(results);
});

app.get("/api/members/:id", async (c) => {
  const member = await c.env.DB.prepare(
    `SELECT m.*, ms.type AS membership_type, ms.next_due_date,
            ms.active AS membership_active
       FROM members m
       LEFT JOIN memberships ms ON ms.membership_id = m.membership_id
      WHERE m.member_id = ?`
  ).bind(c.req.param("id")).first();
  if (!member) return c.json({ error: "Member not found" }, 404);
  return c.json(member);
});

app.post("/api/members", async (c) => {
  const b = await c.req.json();
  const userEmail = getUserEmail(c);

  if (!b.first_name || !b.last_name) {
    return c.json({ error: "first_name and last_name are required" }, 400);
  }

  let membershipId = b.membership_id;
  let isPayer = b.is_payer ? 1 : 0;

  const yearsPaid = Math.max(1, parseInt(b.years_paid) || 1);
  const currentYear = new Date().getFullYear();
  const nextDueYear = currentYear + yearsPaid;
  const nextDueDate = nextDueYear + "-01-01";

  if (!membershipId) {
    const ms = await c.env.DB.prepare(
      "INSERT INTO memberships (type, active, next_due_date, created_date) VALUES (?, 1, ?, date('now'))"
    ).bind(b.membership_type || "Individual", nextDueDate).run();
    membershipId = ms.meta.last_row_id;
    isPayer = 1;
  }

  const res = await c.env.DB.prepare(
    `INSERT INTO members
       (membership_id, is_payer, last_name, first_name, pronouns_title,
        street_address, city, province, postal_code, phone, phone_secondary,
        email, date_joined, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
  ).bind(
    membershipId, isPayer,
    b.last_name, b.first_name, b.pronouns_title ?? null,
    b.street_address ?? null, b.city ?? null, b.province ?? null,
    b.postal_code ?? null, b.phone ?? null, b.phone_secondary ?? null,
    b.email ?? null, b.date_joined ?? null, b.notes ?? null
  ).run();

  const memberId = res.meta.last_row_id;

  if (b.initial_payment_amount && Number(b.initial_payment_amount) > 0) {
    const amountCents = Math.round(Number(b.initial_payment_amount) * 100);
    await c.env.DB.prepare(
      `INSERT INTO payments
         (membership_id, paid_by_member_id, amount_cents, method,
          date_received, dues_year, notes)
       VALUES (?, ?, ?, ?, date('now'), ?, ?)`
    ).bind(
      membershipId, memberId, amountCents,
      b.initial_payment_method || "etransfer",
      currentYear,
      "Initial membership payment"
    ).run();
  }

  await logAudit(c.env.DB, {
    userEmail,
    action: "CREATE",
    entityType: "member",
    entityId: memberId,
    newValues: { first_name: b.first_name, last_name: b.last_name, membership_type: b.membership_type || "Individual", years_paid: yearsPaid },
    summary: `Added member: ${b.first_name} ${b.last_name} (${b.membership_type || "Individual"}, ${yearsPaid}yr)`
  });

  return c.json({ member_id: memberId, membership_id: membershipId }, 201);
});

app.put("/api/members/:id", async (c) => {
  const id = c.req.param("id");
  const b = await c.req.json();
  const userEmail = getUserEmail(c);

  const existing = await c.env.DB.prepare(
    "SELECT * FROM members WHERE member_id = ?"
  ).bind(id).first();
  if (!existing) return c.json({ error: "Member not found" }, 404);

  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);

  const oldVals = {};
  const newVals = {};
  ['last_name','first_name','pronouns_title','street_address','city','province','postal_code','phone','phone_secondary','email','date_joined','notes','is_payer']
    .forEach(k => {
      const oldV = existing[k];
      const newV = v(k);
      if (String(oldV ?? '') !== String(newV ?? '')) {
        oldVals[k] = oldV;
        newVals[k] = newV;
      }
    });

  await c.env.DB.prepare(
    `UPDATE members SET
       last_name = ?, first_name = ?, pronouns_title = ?, street_address = ?,
       city = ?, province = ?, postal_code = ?, phone = ?, phone_secondary = ?,
       email = ?, date_joined = ?, notes = ?, is_payer = ?, membership_id = ?
     WHERE member_id = ?`
  ).bind(
    v("last_name"), v("first_name"), v("pronouns_title"), v("street_address"),
    v("city"), v("province"), v("postal_code"), v("phone"), v("phone_secondary"),
    v("email"), v("date_joined"), v("notes"), v("is_payer") ? 1 : 0,
    v("membership_id"), id
  ).run();

  if (Object.keys(newVals).length > 0) {
    await logAudit(c.env.DB, {
      userEmail,
      action: "UPDATE",
      entityType: "member",
      entityId: Number(id),
      oldValues: oldVals,
      newValues: newVals,
      summary: `Edited member: ${v("first_name")} ${v("last_name")}`
    });
  }

  return c.json({ ok: true });
});

app.delete("/api/members/:id", async (c) => {
  const id = c.req.param("id");
  const userEmail = getUserEmail(c);

  const existing = await c.env.DB.prepare(
    "SELECT first_name, last_name FROM members WHERE member_id = ?"
  ).bind(id).first();

  await c.env.DB.prepare(
    "UPDATE payments SET paid_by_member_id = NULL WHERE paid_by_member_id = ?"
  ).bind(id).run();
  const res = await c.env.DB.prepare(
    "DELETE FROM members WHERE member_id = ?"
  ).bind(id).run();
  if (res.meta.changes === 0) return c.json({ error: "Member not found" }, 404);

  await logAudit(c.env.DB, {
    userEmail,
    action: "DELETE",
    entityType: "member",
    entityId: Number(id),
    oldValues: existing,
    summary: `Deleted member: ${existing?.first_name} ${existing?.last_name}`
  });

  return c.json({ ok: true });
});

// ===================================================================
//  Memberships
// ===================================================================
app.put("/api/memberships/:id", async (c) => {
  const id = c.req.param("id");
  const b = await c.req.json();
  const userEmail = getUserEmail(c);

  const existing = await c.env.DB.prepare(
    "SELECT * FROM memberships WHERE membership_id = ?"
  ).bind(id).first();
  if (!existing) return c.json({ error: "Membership not found" }, 404);

  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);
  const newActive = b.active !== undefined ? (b.active ? 1 : 0) : existing.active;

  const oldVals = {};
  const newVals = {};
  if (v("type") !== existing.type) { oldVals.type = existing.type; newVals.type = v("type"); }
  if (v("next_due_date") !== existing.next_due_date) { oldVals.next_due_date = existing.next_due_date; newVals.next_due_date = v("next_due_date"); }
  if (newActive !== existing.active) { oldVals.active = existing.active; newVals.active = newActive; }

  await c.env.DB.prepare(
    `UPDATE memberships SET type = ?, next_due_date = ?, active = ?, notes = ?
     WHERE membership_id = ?`
  ).bind(v("type"), v("next_due_date"), newActive, v("notes"), id).run();

  if (Object.keys(newVals).length > 0) {
    let action = "UPDATE";
    let summary = `Updated membership #${id}`;
    if (newVals.active === 0) { action = "DEACTIVATE"; summary = `Deactivated membership #${id}`; }
    else if (newVals.active === 1 && existing.active === 0) { action = "REACTIVATE"; summary = `Reactivated membership #${id}`; }

    await logAudit(c.env.DB, {
      userEmail, action, entityType: "membership", entityId: Number(id),
      oldValues: oldVals, newValues: newVals, summary
    });
  }

  return c.json({ ok: true });
});

// ===================================================================
//  Payments
// ===================================================================
app.get("/api/payments", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT p.payment_id, p.membership_id, p.amount_cents, p.method,
            p.date_received, p.dues_year, p.notes, p.paid_by_member_id,
            payer.first_name AS payer_first_name,
            payer.last_name  AS payer_last_name,
            ms.type AS membership_type
       FROM payments p
       LEFT JOIN members payer ON payer.member_id = p.paid_by_member_id
       LEFT JOIN memberships ms ON ms.membership_id = p.membership_id
      ORDER BY p.date_received DESC, p.payment_id DESC`
  ).all();
  return c.json(results);
});

app.get("/api/payments/:id", async (c) => {
  const payment = await c.env.DB.prepare(
    `SELECT p.*, payer.first_name AS payer_first_name, payer.last_name AS payer_last_name,
            ms.type AS membership_type
       FROM payments p
       LEFT JOIN members payer ON payer.member_id = p.paid_by_member_id
       LEFT JOIN memberships ms ON ms.membership_id = p.membership_id
      WHERE p.payment_id = ?`
  ).bind(c.req.param("id")).first();
  if (!payment) return c.json({ error: "Payment not found" }, 404);
  return c.json(payment);
});

app.post("/api/payments", async (c) => {
  const b = await c.req.json();
  const userEmail = getUserEmail(c);
  const validMethods = ["etransfer", "cash", "cheque"];

  if (!b.membership_id) return c.json({ error: "membership_id is required" }, 400);
  if (!validMethods.includes(b.method)) {
    return c.json({ error: "method must be one of: etransfer, cash, cheque" }, 400);
  }
  if (b.amount == null) return c.json({ error: "amount is required" }, 400);

  const amountCents = Math.round(Number(b.amount) * 100);
  const dateReceived = b.date_received || new Date().toISOString().slice(0, 10);
  const duesYear = b.dues_year || new Date().getFullYear();

  const res = await c.env.DB.prepare(
    `INSERT INTO payments
       (membership_id, paid_by_member_id, amount_cents, method,
        date_received, dues_year, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?)`
  ).bind(
    b.membership_id, b.paid_by_member_id ?? null, amountCents, b.method,
    dateReceived, duesYear, b.notes ?? null
  ).run();

  const paymentId = res.meta.last_row_id;

  // Auto-update next_due_date
  const membership = await c.env.DB.prepare(
    "SELECT type, next_due_date FROM memberships WHERE membership_id = ?"
  ).bind(b.membership_id).first();

  if (membership) {
    const typeInfo = await c.env.DB.prepare(
      "SELECT annual_fee_cents FROM membership_types WHERE type = ?"
    ).bind(membership.type).first();

    if (typeInfo && typeInfo.annual_fee_cents > 0) {
      const yearsCovered = Math.floor(amountCents / typeInfo.annual_fee_cents);
      if (yearsCovered > 0) {
        const newDueYear = Number(duesYear) + yearsCovered;
        const newDueDate = newDueYear + "-01-01";
        const currentDue = membership.next_due_date || "0000-01-01";
        if (newDueDate > currentDue) {
          await c.env.DB.prepare(
            "UPDATE memberships SET next_due_date = ? WHERE membership_id = ?"
          ).bind(newDueDate, b.membership_id).run();
        }
      }
    }
  }

  let payerName = "Unknown";
  if (b.paid_by_member_id) {
    const payer = await c.env.DB.prepare(
      "SELECT first_name, last_name FROM members WHERE member_id = ?"
    ).bind(b.paid_by_member_id).first();
    if (payer) payerName = `${payer.first_name} ${payer.last_name}`;
  }

  await logAudit(c.env.DB, {
    userEmail,
    action: "CREATE",
    entityType: "payment",
    entityId: paymentId,
    newValues: { membership_id: b.membership_id, amount: b.amount, method: b.method, dues_year: duesYear },
    summary: `Recorded $${Number(b.amount).toFixed(2)} payment from ${payerName} (${b.method}, year ${duesYear})`
  });

  return c.json({ payment_id: paymentId }, 201);
});

// Edit a payment
app.put("/api/payments/:id", async (c) => {
  const id = c.req.param("id");
  const b = await c.req.json();
  const userEmail = getUserEmail(c);
  const validMethods = ["etransfer", "cash", "cheque"];

  const existing = await c.env.DB.prepare(
    `SELECT p.*, payer.first_name AS payer_first_name, payer.last_name AS payer_last_name
       FROM payments p
       LEFT JOIN members payer ON payer.member_id = p.paid_by_member_id
      WHERE p.payment_id = ?`
  ).bind(id).first();
  if (!existing) return c.json({ error: "Payment not found" }, 404);

  const newMethod = b.method || existing.method;
  if (!validMethods.includes(newMethod)) {
    return c.json({ error: "method must be one of: etransfer, cash, cheque" }, 400);
  }

  const newAmountCents = b.amount != null ? Math.round(Number(b.amount) * 100) : existing.amount_cents;
  const newDateReceived = b.date_received || existing.date_received;
  const newDuesYear = b.dues_year || existing.dues_year;
  const newNotes = b.notes !== undefined ? b.notes : existing.notes;

  // Track changes for audit
  const oldVals = {};
  const newVals = {};
  if (newAmountCents !== existing.amount_cents) {
    oldVals.amount = (existing.amount_cents / 100).toFixed(2);
    newVals.amount = (newAmountCents / 100).toFixed(2);
  }
  if (newMethod !== existing.method) { oldVals.method = existing.method; newVals.method = newMethod; }
  if (newDateReceived !== existing.date_received) { oldVals.date_received = existing.date_received; newVals.date_received = newDateReceived; }
  if (Number(newDuesYear) !== Number(existing.dues_year)) { oldVals.dues_year = existing.dues_year; newVals.dues_year = newDuesYear; }
  if (newNotes !== existing.notes) { oldVals.notes = existing.notes; newVals.notes = newNotes; }

  await c.env.DB.prepare(
    `UPDATE payments SET amount_cents = ?, method = ?, date_received = ?, dues_year = ?, notes = ?
     WHERE payment_id = ?`
  ).bind(newAmountCents, newMethod, newDateReceived, newDuesYear, newNotes, id).run();

  // Recalculate next_due_date if amount or dues_year changed
  if (newVals.amount || newVals.dues_year) {
    const membership = await c.env.DB.prepare(
      "SELECT type FROM memberships WHERE membership_id = ?"
    ).bind(existing.membership_id).first();

    if (membership) {
      const typeInfo = await c.env.DB.prepare(
        "SELECT annual_fee_cents FROM membership_types WHERE type = ?"
      ).bind(membership.type).first();

      if (typeInfo && typeInfo.annual_fee_cents > 0) {
        // Recalculate from ALL payments for this membership
        const { results: allPayments } = await c.env.DB.prepare(
          "SELECT amount_cents, dues_year FROM payments WHERE membership_id = ?"
        ).bind(existing.membership_id).all();

        let maxDue = 0;
        for (const p of allPayments) {
          const yrs = Math.floor(p.amount_cents / typeInfo.annual_fee_cents);
          const due = Number(p.dues_year) + yrs;
          if (due > maxDue) maxDue = due;
        }

        if (maxDue > 0) {
          await c.env.DB.prepare(
            "UPDATE memberships SET next_due_date = ? WHERE membership_id = ?"
          ).bind(maxDue + "-01-01", existing.membership_id).run();
        }
      }
    }
  }

  if (Object.keys(newVals).length > 0) {
    const payerName = [existing.payer_first_name, existing.payer_last_name].filter(Boolean).join(' ') || 'Unknown';
    await logAudit(c.env.DB, {
      userEmail,
      action: "UPDATE",
      entityType: "payment",
      entityId: Number(id),
      oldValues: oldVals,
      newValues: newVals,
      summary: `Edited payment #${id} from ${payerName}`
    });
  }

  return c.json({ ok: true });
});

// ===================================================================
//  Reports
// ===================================================================

// Dues outstanding: active members whose next_due_date is past
app.get("/api/reports/dues-outstanding", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT m.member_id, m.first_name, m.last_name, m.email, m.is_payer,
            ms.membership_id, ms.type AS membership_type,
            ms.next_due_date,
            mt.annual_fee_cents
       FROM members m
       JOIN memberships ms ON ms.membership_id = m.membership_id
       JOIN membership_types mt ON mt.type = ms.type
      WHERE ms.active = 1
        AND m.is_payer = 1
        AND ms.next_due_date IS NOT NULL
        AND ms.next_due_date <= date('now')
      ORDER BY ms.next_due_date ASC`
  ).all();
  return c.json(results);
});

// Revenue by year
app.get("/api/reports/revenue-by-year", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT p.dues_year,
            ms.type AS membership_type,
            COUNT(*) AS payment_count,
            SUM(p.amount_cents) AS total_cents
       FROM payments p
       LEFT JOIN memberships ms ON ms.membership_id = p.membership_id
      GROUP BY p.dues_year, ms.type
      ORDER BY p.dues_year DESC, ms.type`
  ).all();
  return c.json(results);
});

// Membership summary
app.get("/api/reports/membership-summary", async (c) => {
  const { results: byType } = await c.env.DB.prepare(
    `SELECT ms.type, ms.active,
            COUNT(DISTINCT ms.membership_id) AS membership_count,
            COUNT(m.member_id) AS member_count
       FROM memberships ms
       LEFT JOIN members m ON m.membership_id = ms.membership_id
      GROUP BY ms.type, ms.active
      ORDER BY ms.type`
  ).all();
  return c.json(byType);
});

// ===================================================================
//  Audit Log
// ===================================================================
app.get("/api/audit-log", async (c) => {
  const limit = Math.min(parseInt(c.req.query("limit") || "100"), 500);
  const offset = parseInt(c.req.query("offset") || "0");
  const { results } = await c.env.DB.prepare(
    `SELECT * FROM audit_log ORDER BY timestamp DESC, log_id DESC LIMIT ? OFFSET ?`
  ).bind(limit, offset).all();

  const countResult = await c.env.DB.prepare(
    "SELECT COUNT(*) as total FROM audit_log"
  ).first();

  return c.json({ entries: results, total: countResult.total });
});

export default app;

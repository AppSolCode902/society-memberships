import { Hono } from "hono";

const app = new Hono();

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
            ms.membership_id, ms.type AS membership_type, ms.next_due_date
       FROM members m
       LEFT JOIN memberships ms ON ms.membership_id = m.membership_id
      ORDER BY m.last_name, m.first_name`
  ).all();
  return c.json(results);
});

app.get("/api/members/:id", async (c) => {
  const member = await c.env.DB.prepare(
    `SELECT m.*, ms.type AS membership_type, ms.next_due_date
       FROM members m
       LEFT JOIN memberships ms ON ms.membership_id = m.membership_id
      WHERE m.member_id = ?`
  ).bind(c.req.param("id")).first();
  if (!member) return c.json({ error: "Member not found" }, 404);
  return c.json(member);
});

app.post("/api/members", async (c) => {
  const b = await c.req.json();
  if (!b.first_name || !b.last_name) {
    return c.json({ error: "first_name and last_name are required" }, 400);
  }
  let membershipId = b.membership_id;
  let isPayer = b.is_payer ? 1 : 0;
  if (!membershipId) {
    const ms = await c.env.DB.prepare(
      "INSERT INTO memberships (type, created_date) VALUES (?, date('now'))"
    ).bind(b.membership_type || "Individual").run();
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
  return c.json({ member_id: res.meta.last_row_id, membership_id: membershipId }, 201);
});

// Update a member — sends back the fields you pass, keeps the rest unchanged.
app.put("/api/members/:id", async (c) => {
  const id = c.req.param("id");
  const b = await c.req.json();
  const existing = await c.env.DB.prepare(
    "SELECT * FROM members WHERE member_id = ?"
  ).bind(id).first();
  if (!existing) return c.json({ error: "Member not found" }, 404);
  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);
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
  return c.json({ ok: true });
});

app.delete("/api/members/:id", async (c) => {
  const res = await c.env.DB.prepare(
    "DELETE FROM members WHERE member_id = ?"
  ).bind(c.req.param("id")).run();
  if (res.meta.changes === 0) return c.json({ error: "Member not found" }, 404);
  return c.json({ ok: true });
});

// ===================================================================
//  Memberships  (set type / next due date / active status)
// ===================================================================
app.put("/api/memberships/:id", async (c) => {
  const id = c.req.param("id");
  const b = await c.req.json();
  const existing = await c.env.DB.prepare(
    "SELECT * FROM memberships WHERE membership_id = ?"
  ).bind(id).first();
  if (!existing) return c.json({ error: "Membership not found" }, 404);
  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);
  await c.env.DB.prepare(
    `UPDATE memberships SET type = ?, next_due_date = ?, active = ?, notes = ?
     WHERE membership_id = ?`
  ).bind(v("type"), v("next_due_date"), v("active") ? 1 : 0, v("notes"), id).run();
  return c.json({ ok: true });
});

// ===================================================================
//  Payments
// ===================================================================
app.get("/api/payments", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT p.payment_id, p.membership_id, p.amount_cents, p.method,
            p.date_received, p.dues_year, p.notes,
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

// Record a payment. Amount comes in as DOLLARS and is stored as cents.
// This is the same endpoint the e-Transfer email Worker will call later.
app.post("/api/payments", async (c) => {
  const b = await c.req.json();
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
  return c.json({ payment_id: res.meta.last_row_id }, 201);
});

export default app;

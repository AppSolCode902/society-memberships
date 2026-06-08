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
  ).bind(userEmail||"unknown", action, entityType, entityId??null,
    oldValues?JSON.stringify(oldValues):null, newValues?JSON.stringify(newValues):null, summary||null
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
            m.city, m.province, m.is_payer, m.date_joined, m.unsubscribed,
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
    `SELECT m.*, ms.type AS membership_type, ms.next_due_date, ms.active AS membership_active
       FROM members m LEFT JOIN memberships ms ON ms.membership_id = m.membership_id
      WHERE m.member_id = ?`
  ).bind(c.req.param("id")).first();
  if (!member) return c.json({ error: "Member not found" }, 404);
  return c.json(member);
});

app.post("/api/members", async (c) => {
  const b = await c.req.json();
  const userEmail = getUserEmail(c);
  if (!b.first_name || !b.last_name) return c.json({ error: "first_name and last_name are required" }, 400);

  let membershipId = b.membership_id, isPayer = b.is_payer ? 1 : 0;
  const yearsPaid = Math.max(1, parseInt(b.years_paid) || 1);
  const currentYear = new Date().getFullYear();
  const nextDueDate = (currentYear + yearsPaid) + "-01-01";

  if (!membershipId) {
    const ms = await c.env.DB.prepare(
      "INSERT INTO memberships (type, active, next_due_date, created_date) VALUES (?, 1, ?, date('now'))"
    ).bind(b.membership_type || "Individual", nextDueDate).run();
    membershipId = ms.meta.last_row_id; isPayer = 1;
  }

  const res = await c.env.DB.prepare(
    `INSERT INTO members (membership_id, is_payer, last_name, first_name, pronouns_title,
        street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
  ).bind(membershipId, isPayer, b.last_name, b.first_name, b.pronouns_title??null,
    b.street_address??null, b.city??null, b.province??null, b.postal_code??null,
    b.phone??null, b.phone_secondary??null, b.email??null, b.date_joined??null, b.notes??null
  ).run();
  const memberId = res.meta.last_row_id;

  if (b.initial_payment_amount && Number(b.initial_payment_amount) > 0) {
    const amountCents = Math.round(Number(b.initial_payment_amount) * 100);
    await c.env.DB.prepare(
      `INSERT INTO payments (membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes)
       VALUES (?, ?, ?, ?, date('now'), ?, ?)`
    ).bind(membershipId, memberId, amountCents, b.initial_payment_method||"etransfer", currentYear, "Initial membership payment").run();
  }

  await logAudit(c.env.DB, { userEmail, action:"CREATE", entityType:"member", entityId:memberId,
    newValues:{first_name:b.first_name,last_name:b.last_name,membership_type:b.membership_type||"Individual",years_paid:yearsPaid},
    summary:`Added member: ${b.first_name} ${b.last_name} (${b.membership_type||"Individual"}, ${yearsPaid}yr)` });

  return c.json({ member_id: memberId, membership_id: membershipId }, 201);
});

app.put("/api/members/:id", async (c) => {
  const id = c.req.param("id"); const b = await c.req.json(); const userEmail = getUserEmail(c);
  const existing = await c.env.DB.prepare("SELECT * FROM members WHERE member_id = ?").bind(id).first();
  if (!existing) return c.json({ error: "Member not found" }, 404);
  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);

  const oldVals = {}, newVals = {};
  ['last_name','first_name','pronouns_title','street_address','city','province','postal_code','phone','phone_secondary','email','date_joined','notes','is_payer','unsubscribed']
    .forEach(k => { if (String(existing[k]??'') !== String(v(k)??'')) { oldVals[k]=existing[k]; newVals[k]=v(k); } });

  await c.env.DB.prepare(
    `UPDATE members SET last_name=?, first_name=?, pronouns_title=?, street_address=?,
       city=?, province=?, postal_code=?, phone=?, phone_secondary=?,
       email=?, date_joined=?, notes=?, is_payer=?, membership_id=?, unsubscribed=? WHERE member_id=?`
  ).bind(v("last_name"),v("first_name"),v("pronouns_title"),v("street_address"),
    v("city"),v("province"),v("postal_code"),v("phone"),v("phone_secondary"),
    v("email"),v("date_joined"),v("notes"),v("is_payer")?1:0,v("membership_id"),v("unsubscribed")?1:0,id
  ).run();

  if (Object.keys(newVals).length > 0) {
    await logAudit(c.env.DB, { userEmail, action:"UPDATE", entityType:"member", entityId:Number(id),
      oldValues:oldVals, newValues:newVals, summary:`Edited member: ${v("first_name")} ${v("last_name")}` });
  }
  return c.json({ ok: true });
});

app.delete("/api/members/:id", async (c) => {
  const id = c.req.param("id"); const userEmail = getUserEmail(c);
  const existing = await c.env.DB.prepare("SELECT first_name, last_name FROM members WHERE member_id = ?").bind(id).first();
  await c.env.DB.prepare("UPDATE payments SET paid_by_member_id = NULL WHERE paid_by_member_id = ?").bind(id).run();
  const res = await c.env.DB.prepare("DELETE FROM members WHERE member_id = ?").bind(id).run();
  if (res.meta.changes === 0) return c.json({ error: "Member not found" }, 404);
  await logAudit(c.env.DB, { userEmail, action:"DELETE", entityType:"member", entityId:Number(id),
    oldValues:existing, summary:`Deleted member: ${existing?.first_name} ${existing?.last_name}` });
  return c.json({ ok: true });
});

// ===================================================================
//  Memberships
// ===================================================================
app.put("/api/memberships/:id", async (c) => {
  const id = c.req.param("id"); const b = await c.req.json(); const userEmail = getUserEmail(c);
  const existing = await c.env.DB.prepare("SELECT * FROM memberships WHERE membership_id = ?").bind(id).first();
  if (!existing) return c.json({ error: "Membership not found" }, 404);
  const v = (k) => (b[k] !== undefined ? b[k] : existing[k]);
  const newActive = b.active !== undefined ? (b.active ? 1 : 0) : existing.active;

  const oldVals = {}, newVals = {};
  if (v("type")!==existing.type) { oldVals.type=existing.type; newVals.type=v("type"); }
  if (v("next_due_date")!==existing.next_due_date) { oldVals.next_due_date=existing.next_due_date; newVals.next_due_date=v("next_due_date"); }
  if (newActive!==existing.active) { oldVals.active=existing.active; newVals.active=newActive; }

  await c.env.DB.prepare("UPDATE memberships SET type=?, next_due_date=?, active=?, notes=? WHERE membership_id=?")
    .bind(v("type"),v("next_due_date"),newActive,v("notes"),id).run();

  if (Object.keys(newVals).length > 0) {
    let action="UPDATE",summary=`Updated membership #${id}`;
    if(newVals.active===0){action="DEACTIVATE";summary=`Deactivated membership #${id}`;}
    else if(newVals.active===1&&existing.active===0){action="REACTIVATE";summary=`Reactivated membership #${id}`;}
    await logAudit(c.env.DB, { userEmail, action, entityType:"membership", entityId:Number(id), oldValues:oldVals, newValues:newVals, summary });
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
            payer.first_name AS payer_first_name, payer.last_name AS payer_last_name,
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
    `SELECT p.*, payer.first_name AS payer_first_name, payer.last_name AS payer_last_name, ms.type AS membership_type
       FROM payments p LEFT JOIN members payer ON payer.member_id = p.paid_by_member_id
       LEFT JOIN memberships ms ON ms.membership_id = p.membership_id WHERE p.payment_id = ?`
  ).bind(c.req.param("id")).first();
  if (!payment) return c.json({ error: "Payment not found" }, 404);
  return c.json(payment);
});

app.post("/api/payments", async (c) => {
  const b = await c.req.json(); const userEmail = getUserEmail(c);
  const validMethods = ["etransfer","cash","cheque"];
  if (!b.membership_id) return c.json({ error: "membership_id is required" }, 400);
  if (!validMethods.includes(b.method)) return c.json({ error: "method must be one of: etransfer, cash, cheque" }, 400);
  if (b.amount == null) return c.json({ error: "amount is required" }, 400);

  const amountCents = Math.round(Number(b.amount)*100);
  const dateReceived = b.date_received || new Date().toISOString().slice(0,10);
  const duesYear = b.dues_year || new Date().getFullYear();

  const res = await c.env.DB.prepare(
    `INSERT INTO payments (membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?)`
  ).bind(b.membership_id, b.paid_by_member_id??null, amountCents, b.method, dateReceived, duesYear, b.notes??null).run();
  const paymentId = res.meta.last_row_id;

  // Auto-update next_due_date
  const membership = await c.env.DB.prepare("SELECT type, next_due_date FROM memberships WHERE membership_id = ?").bind(b.membership_id).first();
  if (membership) {
    const typeInfo = await c.env.DB.prepare("SELECT annual_fee_cents FROM membership_types WHERE type = ?").bind(membership.type).first();
    if (typeInfo && typeInfo.annual_fee_cents > 0) {
      const yearsCovered = Math.floor(amountCents / typeInfo.annual_fee_cents);
      if (yearsCovered > 0) {
        const newDueDate = (Number(duesYear) + yearsCovered) + "-01-01";
        if (newDueDate > (membership.next_due_date || "0000-01-01")) {
          await c.env.DB.prepare("UPDATE memberships SET next_due_date = ? WHERE membership_id = ?").bind(newDueDate, b.membership_id).run();
        }
      }
    }
  }

  let payerName = "Unknown";
  if (b.paid_by_member_id) {
    const payer = await c.env.DB.prepare("SELECT first_name, last_name FROM members WHERE member_id = ?").bind(b.paid_by_member_id).first();
    if (payer) payerName = `${payer.first_name} ${payer.last_name}`;
  }
  await logAudit(c.env.DB, { userEmail, action:"CREATE", entityType:"payment", entityId:paymentId,
    newValues:{membership_id:b.membership_id,amount:b.amount,method:b.method,dues_year:duesYear},
    summary:`Recorded $${Number(b.amount).toFixed(2)} payment from ${payerName} (${b.method}, year ${duesYear})` });

  return c.json({ payment_id: paymentId }, 201);
});

app.put("/api/payments/:id", async (c) => {
  const id = c.req.param("id"); const b = await c.req.json(); const userEmail = getUserEmail(c);
  const validMethods = ["etransfer","cash","cheque"];
  const existing = await c.env.DB.prepare(
    `SELECT p.*, payer.first_name AS payer_first_name, payer.last_name AS payer_last_name
       FROM payments p LEFT JOIN members payer ON payer.member_id = p.paid_by_member_id WHERE p.payment_id = ?`
  ).bind(id).first();
  if (!existing) return c.json({ error: "Payment not found" }, 404);

  const newMethod = b.method||existing.method;
  if (!validMethods.includes(newMethod)) return c.json({ error: "Invalid method" }, 400);
  const newAmountCents = b.amount!=null ? Math.round(Number(b.amount)*100) : existing.amount_cents;
  const newDateReceived = b.date_received||existing.date_received;
  const newDuesYear = b.dues_year||existing.dues_year;
  const newNotes = b.notes!==undefined ? b.notes : existing.notes;

  const oldVals={},newVals={};
  if(newAmountCents!==existing.amount_cents){oldVals.amount=(existing.amount_cents/100).toFixed(2);newVals.amount=(newAmountCents/100).toFixed(2);}
  if(newMethod!==existing.method){oldVals.method=existing.method;newVals.method=newMethod;}
  if(newDateReceived!==existing.date_received){oldVals.date_received=existing.date_received;newVals.date_received=newDateReceived;}
  if(Number(newDuesYear)!==Number(existing.dues_year)){oldVals.dues_year=existing.dues_year;newVals.dues_year=newDuesYear;}
  if(newNotes!==existing.notes){oldVals.notes=existing.notes;newVals.notes=newNotes;}

  await c.env.DB.prepare("UPDATE payments SET amount_cents=?, method=?, date_received=?, dues_year=?, notes=? WHERE payment_id=?")
    .bind(newAmountCents,newMethod,newDateReceived,newDuesYear,newNotes,id).run();

  if(newVals.amount||newVals.dues_year){
    const ms=await c.env.DB.prepare("SELECT type FROM memberships WHERE membership_id=?").bind(existing.membership_id).first();
    if(ms){const ti=await c.env.DB.prepare("SELECT annual_fee_cents FROM membership_types WHERE type=?").bind(ms.type).first();
      if(ti&&ti.annual_fee_cents>0){const{results:ap}=await c.env.DB.prepare("SELECT amount_cents,dues_year FROM payments WHERE membership_id=?").bind(existing.membership_id).all();
        let mx=0;for(const p of ap){const yr=Math.floor(p.amount_cents/ti.annual_fee_cents);const d=Number(p.dues_year)+yr;if(d>mx)mx=d;}
        if(mx>0)await c.env.DB.prepare("UPDATE memberships SET next_due_date=? WHERE membership_id=?").bind(mx+"-01-01",existing.membership_id).run();
      }
    }
  }

  if(Object.keys(newVals).length>0){
    const pn=[existing.payer_first_name,existing.payer_last_name].filter(Boolean).join(' ')||'Unknown';
    await logAudit(c.env.DB,{userEmail,action:"UPDATE",entityType:"payment",entityId:Number(id),oldValues:oldVals,newValues:newVals,summary:`Edited payment #${id} from ${pn}`});
  }
  return c.json({ ok: true });
});

// ===================================================================
//  Documents (Executive Meetings)
// ===================================================================
app.get("/api/documents", async (c) => {
  const { results } = await c.env.DB.prepare(
    "SELECT * FROM documents ORDER BY doc_date DESC, uploaded_at DESC"
  ).all();
  return c.json(results);
});

app.post("/api/documents", async (c) => {
  const userEmail = getUserEmail(c);
  const formData = await c.req.formData();
  const file = formData.get("file");
  const title = formData.get("title") || file.name;
  const category = formData.get("category") || "CIS Documents";
  const docDate = formData.get("doc_date") || new Date().toISOString().slice(0,10);
  const notes = formData.get("notes") || null;

  if (!file) return c.json({ error: "No file provided" }, 400);

  const fileKey = `${Date.now()}-${file.name.replace(/[^a-zA-Z0-9._-]/g, '_')}`;
  const fileBuffer = await file.arrayBuffer();

  // Upload to R2
  await c.env.DOCS.put(fileKey, fileBuffer, {
    httpMetadata: { contentType: file.type },
    customMetadata: { originalName: file.name, uploadedBy: userEmail }
  });

  // Store metadata in D1
  const res = await c.env.DB.prepare(
    `INSERT INTO documents (title, category, file_key, file_name, file_size, file_type, doc_date, uploaded_by, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`
  ).bind(title, category, fileKey, file.name, fileBuffer.byteLength, file.type, docDate, userEmail, notes).run();

  await logAudit(c.env.DB, { userEmail, action:"CREATE", entityType:"document", entityId:res.meta.last_row_id,
    newValues:{title, category, file_name:file.name}, summary:`Uploaded document: ${title} (${category})` });

  return c.json({ doc_id: res.meta.last_row_id, file_key: fileKey }, 201);
});

app.get("/api/documents/:id/download", async (c) => {
  const doc = await c.env.DB.prepare("SELECT * FROM documents WHERE doc_id = ?").bind(c.req.param("id")).first();
  if (!doc) return c.json({ error: "Document not found" }, 404);

  const object = await c.env.DOCS.get(doc.file_key);
  if (!object) return c.json({ error: "File not found in storage" }, 404);

  const headers = new Headers();
  headers.set("Content-Type", doc.file_type || "application/octet-stream");
  headers.set("Content-Disposition", `attachment; filename="${doc.file_name}"`);
  return new Response(object.body, { headers });
});

app.delete("/api/documents/:id", async (c) => {
  const userEmail = getUserEmail(c);
  const doc = await c.env.DB.prepare("SELECT * FROM documents WHERE doc_id = ?").bind(c.req.param("id")).first();
  if (!doc) return c.json({ error: "Document not found" }, 404);

  // Delete from R2
  await c.env.DOCS.delete(doc.file_key);
  // Delete metadata from D1
  await c.env.DB.prepare("DELETE FROM documents WHERE doc_id = ?").bind(c.req.param("id")).run();

  await logAudit(c.env.DB, { userEmail, action:"DELETE", entityType:"document", entityId:Number(c.req.param("id")),
    oldValues:{title:doc.title, category:doc.category, file_name:doc.file_name},
    summary:`Deleted document: ${doc.title} (${doc.category})` });

  return c.json({ ok: true });
});

// ===================================================================
//  Communications (Email Templates + Send History)
// ===================================================================
app.get("/api/email-templates", async (c) => {
  const { results } = await c.env.DB.prepare(
    "SELECT * FROM email_templates ORDER BY updated_at DESC"
  ).all();
  return c.json(results);
});

app.get("/api/email-templates/:id", async (c) => {
  const t = await c.env.DB.prepare("SELECT * FROM email_templates WHERE template_id = ?").bind(c.req.param("id")).first();
  if (!t) return c.json({ error: "Template not found" }, 404);
  return c.json(t);
});

app.post("/api/email-templates", async (c) => {
  const b = await c.req.json(); const userEmail = getUserEmail(c);
  if (!b.name || !b.subject || !b.body) return c.json({ error: "name, subject, and body are required" }, 400);
  const res = await c.env.DB.prepare(
    "INSERT INTO email_templates (name, subject, body, created_by) VALUES (?, ?, ?, ?)"
  ).bind(b.name, b.subject, b.body, userEmail).run();
  await logAudit(c.env.DB, { userEmail, action:"CREATE", entityType:"email_template", entityId:res.meta.last_row_id,
    newValues:{name:b.name}, summary:`Created email template: ${b.name}` });
  return c.json({ template_id: res.meta.last_row_id }, 201);
});

app.put("/api/email-templates/:id", async (c) => {
  const id = c.req.param("id"); const b = await c.req.json(); const userEmail = getUserEmail(c);
  const existing = await c.env.DB.prepare("SELECT * FROM email_templates WHERE template_id = ?").bind(id).first();
  if (!existing) return c.json({ error: "Template not found" }, 404);
  await c.env.DB.prepare(
    "UPDATE email_templates SET name=?, subject=?, body=?, updated_at=datetime('now') WHERE template_id=?"
  ).bind(b.name||existing.name, b.subject||existing.subject, b.body||existing.body, id).run();
  await logAudit(c.env.DB, { userEmail, action:"UPDATE", entityType:"email_template", entityId:Number(id),
    summary:`Updated email template: ${b.name||existing.name}` });
  return c.json({ ok: true });
});

app.delete("/api/email-templates/:id", async (c) => {
  const id = c.req.param("id"); const userEmail = getUserEmail(c);
  const existing = await c.env.DB.prepare("SELECT name FROM email_templates WHERE template_id = ?").bind(id).first();
  if (!existing) return c.json({ error: "Template not found" }, 404);
  await c.env.DB.prepare("DELETE FROM email_templates WHERE template_id = ?").bind(id).run();
  await logAudit(c.env.DB, { userEmail, action:"DELETE", entityType:"email_template", entityId:Number(id),
    summary:`Deleted email template: ${existing.name}` });
  return c.json({ ok: true });
});

// Preview: resolve template variables against member data
app.post("/api/email-templates/:id/preview", async (c) => {
  const template = await c.env.DB.prepare("SELECT * FROM email_templates WHERE template_id = ?").bind(c.req.param("id")).first();
  if (!template) return c.json({ error: "Template not found" }, 404);

  const b = await c.req.json();
  const filter = b.filter || "all_active";

  let query = `SELECT m.member_id, m.first_name, m.last_name, m.email, ms.type AS membership_type,
                      ms.next_due_date, mt.annual_fee_cents
                 FROM members m
                 JOIN memberships ms ON ms.membership_id = m.membership_id
                 JOIN membership_types mt ON mt.type = ms.type
                WHERE ms.active = 1 AND m.is_payer = 1 AND m.unsubscribed = 0 AND m.email IS NOT NULL AND m.email != ''`;

  if (filter === "overdue") query += ` AND ms.next_due_date IS NOT NULL AND ms.next_due_date <= date('now')`;
  if (filter === "overdue_year" && b.year) query += ` AND ms.next_due_date LIKE '${Number(b.year)}%'`;

  query += " ORDER BY m.last_name, m.first_name";
  const { results: recipients } = await c.env.DB.prepare(query).all();

  // Show first 3 as preview
  const previews = recipients.slice(0, 3).map(r => {
    let subj = template.subject, body = template.body;
    const vars = {
      '{first_name}': r.first_name, '{last_name}': r.last_name,
      '{membership_type}': r.membership_type, '{email}': r.email,
      '{next_due_date}': r.next_due_date || 'N/A',
      '{amount_due}': '$' + ((r.annual_fee_cents||0)/100).toFixed(2),
    };
    for (const [k,v] of Object.entries(vars)) { subj = subj.replaceAll(k, v||''); body = body.replaceAll(k, v||''); }
    return { member: `${r.first_name} ${r.last_name}`, email: r.email, subject: subj, body };
  });

  return c.json({ total_recipients: recipients.length, previews });
});

// Get send history
app.get("/api/email-sends", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT s.*, t.name AS template_name FROM email_sends s
     LEFT JOIN email_templates t ON t.template_id = s.template_id
     ORDER BY s.sent_at DESC`
  ).all();
  return c.json(results);
});

// ===================================================================
//  Reports
// ===================================================================
app.get("/api/reports/dues-outstanding", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT m.member_id, m.first_name, m.last_name, m.email, m.is_payer,
            ms.membership_id, ms.type AS membership_type, ms.next_due_date, mt.annual_fee_cents
       FROM members m JOIN memberships ms ON ms.membership_id = m.membership_id
       JOIN membership_types mt ON mt.type = ms.type
      WHERE ms.active = 1 AND m.is_payer = 1 AND ms.next_due_date IS NOT NULL AND ms.next_due_date <= date('now')
      ORDER BY ms.next_due_date ASC`
  ).all();
  return c.json(results);
});

app.get("/api/reports/revenue-by-year", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT p.dues_year, ms.type AS membership_type, COUNT(*) AS payment_count, SUM(p.amount_cents) AS total_cents
       FROM payments p LEFT JOIN memberships ms ON ms.membership_id = p.membership_id
      GROUP BY p.dues_year, ms.type ORDER BY p.dues_year DESC, ms.type`
  ).all();
  return c.json(results);
});

app.get("/api/reports/membership-summary", async (c) => {
  const { results } = await c.env.DB.prepare(
    `SELECT ms.type, ms.active, COUNT(DISTINCT ms.membership_id) AS membership_count, COUNT(m.member_id) AS member_count
       FROM memberships ms LEFT JOIN members m ON m.membership_id = ms.membership_id
      GROUP BY ms.type, ms.active ORDER BY ms.type`
  ).all();
  return c.json(results);
});

// ===================================================================
//  Audit Log + Restore
// ===================================================================
app.get("/api/audit-log", async (c) => {
  const limit = Math.min(parseInt(c.req.query("limit")||"100"),500);
  const offset = parseInt(c.req.query("offset")||"0");
  const { results } = await c.env.DB.prepare(
    "SELECT * FROM audit_log ORDER BY timestamp DESC, log_id DESC LIMIT ? OFFSET ?"
  ).bind(limit, offset).all();
  const countResult = await c.env.DB.prepare("SELECT COUNT(*) as total FROM audit_log").first();
  return c.json({ entries: results, total: countResult.total });
});

app.post("/api/audit-log/:id/restore", async (c) => {
  const logId = c.req.param("id"); const userEmail = getUserEmail(c);
  const entry = await c.env.DB.prepare("SELECT * FROM audit_log WHERE log_id = ?").bind(logId).first();
  if (!entry) return c.json({ error: "Audit log entry not found" }, 404);
  if (!entry.old_values) return c.json({ error: "No previous values to restore" }, 400);

  const oldVals = JSON.parse(entry.old_values);
  const entityType = entry.entity_type, entityId = entry.entity_id;

  if (entityType === "member" && entityId) {
    const existing = await c.env.DB.prepare("SELECT * FROM members WHERE member_id = ?").bind(entityId).first();
    if (!existing) return c.json({ error: "Member no longer exists" }, 404);
    const fields = ['last_name','first_name','pronouns_title','street_address','city','province','postal_code','phone','phone_secondary','email','date_joined','notes','is_payer'];
    const u = {}; fields.forEach(k => { u[k] = oldVals[k]!==undefined ? oldVals[k] : existing[k]; });
    await c.env.DB.prepare(`UPDATE members SET last_name=?,first_name=?,pronouns_title=?,street_address=?,city=?,province=?,postal_code=?,phone=?,phone_secondary=?,email=?,date_joined=?,notes=?,is_payer=? WHERE member_id=?`)
      .bind(u.last_name,u.first_name,u.pronouns_title,u.street_address,u.city,u.province,u.postal_code,u.phone,u.phone_secondary,u.email,u.date_joined,u.notes,u.is_payer?1:0,entityId).run();
    await logAudit(c.env.DB, { userEmail, action:"RESTORE", entityType:"member", entityId, newValues:oldVals,
      summary:`Restored member #${entityId} to state before log #${logId}` });
    return c.json({ ok:true, restored:"member", id:entityId });
  } else if (entityType === "membership" && entityId) {
    const existing = await c.env.DB.prepare("SELECT * FROM memberships WHERE membership_id = ?").bind(entityId).first();
    if (!existing) return c.json({ error: "Membership no longer exists" }, 404);
    const type = oldVals.type!==undefined ? oldVals.type : existing.type;
    const nextDue = oldVals.next_due_date!==undefined ? oldVals.next_due_date : existing.next_due_date;
    const active = oldVals.active!==undefined ? (oldVals.active?1:0) : existing.active;
    await c.env.DB.prepare("UPDATE memberships SET type=?,next_due_date=?,active=? WHERE membership_id=?").bind(type,nextDue,active,entityId).run();
    await logAudit(c.env.DB, { userEmail, action:"RESTORE", entityType:"membership", entityId, newValues:oldVals,
      summary:`Restored membership #${entityId} to state before log #${logId}` });
    return c.json({ ok:true, restored:"membership", id:entityId });
  } else if (entityType === "payment" && entityId) {
    const existing = await c.env.DB.prepare("SELECT * FROM payments WHERE payment_id = ?").bind(entityId).first();
    if (!existing) return c.json({ error: "Payment no longer exists" }, 404);
    const amt = oldVals.amount!==undefined ? Math.round(Number(oldVals.amount)*100) : existing.amount_cents;
    const mth = oldVals.method!==undefined ? oldVals.method : existing.method;
    const dr = oldVals.date_received!==undefined ? oldVals.date_received : existing.date_received;
    const dy = oldVals.dues_year!==undefined ? oldVals.dues_year : existing.dues_year;
    const nt = oldVals.notes!==undefined ? oldVals.notes : existing.notes;
    await c.env.DB.prepare("UPDATE payments SET amount_cents=?,method=?,date_received=?,dues_year=?,notes=? WHERE payment_id=?").bind(amt,mth,dr,dy,nt,entityId).run();
    await logAudit(c.env.DB, { userEmail, action:"RESTORE", entityType:"payment", entityId, newValues:oldVals,
      summary:`Restored payment #${entityId} to state before log #${logId}` });
    return c.json({ ok:true, restored:"payment", id:entityId });
  }
  return c.json({ error: "Cannot restore this type of change" }, 400);
});

export default app;

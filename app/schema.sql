-- Membership management schema (SQLite / Cloudflare D1)
-- Money is stored in integer CENTS ($20 = 2000). Dates are ISO text 'YYYY-MM-DD'.

-- Reference: membership types and their current annual fee.
-- Changing a fee here affects future dues only; past payments keep their recorded amount.
CREATE TABLE IF NOT EXISTS membership_types (
    type             TEXT PRIMARY KEY,        -- Individual | Couple | Family | Exempt
    annual_fee_cents INTEGER NOT NULL
);

INSERT OR IGNORE INTO membership_types (type, annual_fee_cents) VALUES
    ('Individual', 2000),
    ('Couple',     3000),
    ('Family',     4000),
    ('Exempt',        0);

-- A membership is the billable unit: one fee, one due date, covering 1+ people.
CREATE TABLE IF NOT EXISTS memberships (
    membership_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type          TEXT NOT NULL REFERENCES membership_types(type),
    next_due_date TEXT,
    active        INTEGER NOT NULL DEFAULT 1,
    created_date  TEXT,
    notes         TEXT
);

-- People. Each belongs to one membership; the paying/primary member has is_payer = 1.
CREATE TABLE IF NOT EXISTS members (
    member_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    membership_id   INTEGER REFERENCES memberships(membership_id),
    is_payer        INTEGER NOT NULL DEFAULT 0,
    last_name       TEXT NOT NULL,
    first_name      TEXT NOT NULL,
    pronouns_title  TEXT,
    street_address  TEXT,
    city            TEXT,
    province        TEXT,
    postal_code     TEXT,
    phone           TEXT,
    phone_secondary TEXT,
    email           TEXT,
    date_joined     TEXT,
    notes           TEXT
);

-- Payment log: one row per payment. "for who" = membership_id, "by who" = paid_by_member_id.
CREATE TABLE IF NOT EXISTS payments (
    payment_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    membership_id     INTEGER NOT NULL REFERENCES memberships(membership_id),
    paid_by_member_id INTEGER REFERENCES members(member_id),
    amount_cents      INTEGER NOT NULL,
    method            TEXT NOT NULL CHECK (method IN ('etransfer','cash','cheque')),
    date_received     TEXT NOT NULL,
    dues_year         INTEGER NOT NULL,
    notes             TEXT
);

CREATE INDEX IF NOT EXISTS idx_members_membership  ON members(membership_id);
CREATE INDEX IF NOT EXISTS idx_members_province    ON members(province);
CREATE INDEX IF NOT EXISTS idx_payments_membership ON payments(membership_id);
CREATE INDEX IF NOT EXISTS idx_payments_year       ON payments(dues_year);
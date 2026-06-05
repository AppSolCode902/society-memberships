-- Wipe test data before importing the real roster.
-- Order matters because of foreign keys: payments → members → memberships.
-- We keep membership_types (the seeded Individual/Couple/Family/Exempt fees).

DELETE FROM payments;
DELETE FROM members;
DELETE FROM memberships;

-- Reset the auto-increment counters so imported IDs start from 1.
DELETE FROM sqlite_sequence WHERE name IN ('payments','members','memberships');

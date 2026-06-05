-- ============================================================
-- Halifax Charitable Irish Society - Full Data Import
-- Generated 2026-06-04
-- ============================================================

-- Clear existing data (preserves schema)
DELETE FROM payments;
DELETE FROM members;
DELETE FROM memberships;
DELETE FROM sqlite_sequence WHERE name IN ('memberships','members','payments');

-- Ensure membership_types exist
INSERT OR IGNORE INTO membership_types (type, annual_fee_cents) VALUES ('Individual', 2000);
INSERT OR IGNORE INTO membership_types (type, annual_fee_cents) VALUES ('Couple', 3000);
INSERT OR IGNORE INTO membership_types (type, annual_fee_cents) VALUES ('Family', 4000);
INSERT OR IGNORE INTO membership_types (type, annual_fee_cents) VALUES ('Exempt', 0);

-- Membership 1: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (1, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (1, 1, 1, 'Abbott', 'Barry', 'Mr.', '3876 Newbery St', 'Halifax', 'NS', 'B3K 3L8', '902-455-0257', NULL, 'bpabbott9@gmail.com', '2025-01-01', 'vison impaired link Deb O''Leary');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (1, 1, 1, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 2: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (2, 'Individual', '2027-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (2, 2, 1, 'Atherton', 'Pat', NULL, '1104 Lucknow St', 'Halifax', 'NS', 'B3M 2T6', '902-830-7083', NULL, 'patherton@yahoo.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (2, 2, 2, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 3: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (3, 'Individual', '2027-01-01', 1, '2002-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (3, 3, 1, 'Beck', 'Genanne', NULL, '1720 Garden Street', 'Halifax', 'NS', 'B3H 3R4', '902 220 5785', '902 423 8744', 'beckg@ns.sympatico.ca', '2002-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (3, 3, 3, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 4: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (4, 'Individual', '2027-01-01', 1, '2005-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (4, 4, 1, 'Beck', 'Gerald', 'Mr.', '1720 Garden Street', 'Halifax', 'NS', 'B3H 3N1', '902-429-7032', NULL, 'beck1652@gmail.com', '2005-01-01', 'Genanne''s brother');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (4, 4, 4, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 5: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (5, 'Individual', '2029-01-01', 1, '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (5, 5, 1, 'Beed', 'Blair', 'Mr.', '6467 Summit St.,', 'Halifax', 'NS', 'B3L 1S2', NULL, NULL, 'beedblair@hotmail.com', '2003-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (5, 5, 5, 6000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 6: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (6, 'Individual', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (6, 6, 1, 'Bonk', 'Wanda', NULL, '406 - 6095 Coburg Rd.', 'Halifax', 'NS', 'B3H 4K1', '902 429 3403', NULL, 'wandaeye@hotmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (6, 6, 6, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 7: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (7, 'Individual', '2025-01-01', 1, '1991-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (7, 7, 1, 'Brennan', 'Paul W.', 'Mr.', '416 - 232 Transom Dr', 'Halifax', NULL, 'B3M 0P3', '902 835 1310', '941 735 7077', 'paulbrennan9391@gmail.com', '1991-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (7, 7, 7, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 8: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (8, 'Individual', '2027-01-01', 1, '2007-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (8, 8, 1, 'Brownlow', 'Bridget E.', NULL, '6036 Cherry Street', 'Halifax', 'NS', 'B3H 3K3', '902-431-3169', NULL, 'bridget.brownlow@smu.ca', '2007-01-01', 'pd for 2 yrs in 2023*');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (8, 8, 8, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 9: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (9, 'Individual', '2027-01-01', 1, '2009-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (9, 9, 1, 'Brownlow', 'D''Arcy', NULL, '6036 Cherry Street', 'Halifax', 'NS', 'B3H 3K3', NULL, NULL, 'darcy.brownlow@yahoo.ca', '2009-01-01', 'pd for 2 yrs in 2023*');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (9, 9, 9, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 10: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (10, 'Individual', '2026-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (10, 10, 1, 'Brownlow', 'Mike', NULL, 'moving in June 2025', 'Dartmouth', NULL, NULL, '902-462-2515', NULL, 'm.brownlow@ns.sympatico.ca', '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (10, 10, 10, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 11: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (11, 'Individual', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (11, 11, 1, 'Burgess', 'Gordon', NULL, '12 Edgecombe Cresent', 'Dartmouth', 'NS', 'B2V 2C8', '902-832-4974', NULL, 'gordieburgess123@gmail.com', '2015-01-01', 'cancer surgery Jan 24');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (11, 11, 11, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 12: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (12, 'Individual', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (12, 12, 1, 'Burgess', 'Lori', NULL, '13 Edgecombe Cresent', 'Dartmouth', 'NS', 'B2V 1K9', '902-832-4974', NULL, 'gordieburgess123@gmail.com', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (12, 12, 12, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 13: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (13, 'Individual', '2026-01-01', 1, '1990-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (13, 13, 1, 'Casey', 'Kenneth', 'Mr.', '91 Clayton Park Drive', 'Halifax', 'NS', 'B3M 1M1', '902-455-6488', NULL, '77caseyk@gmail.com', '1990-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (13, 13, 13, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 14: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (14, 'Individual', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (14, 14, 1, 'Cavicchi', 'MJ (Maryjean)', NULL, '273 Kennedy''s Road', 'Boutliers Point', 'NS', 'B3Z 1V7', '902-826-7662', '902 225 7958', 'wmjcavicchi@eastlink.ca', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (14, 14, 14, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 15: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (15, 'Individual', '2029-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (15, 15, 1, 'Chapman', 'Becky', NULL, '23 Slayter Street', 'Dartmouth', 'NS', 'B3A 1Z8', '902-221-7492', NULL, 'becky@risingtideacademy.ca', '2016-01-01', 'Rising Tide owner linked to Laura Hopper');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (15, 15, 15, 8000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 16: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (16, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (16, 16, 1, 'Coakley', 'Andrew', 'Mr.', '112 Capri Dr.', 'West Porters Lake', 'NS', 'B3E 1L6', '902 830 3596', NULL, 'andrewiscoakley@gmail.com', '2025-01-01', 'friend of Ryan Mitchell');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (16, 16, 16, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 17: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (17, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (17, 17, 1, 'Coffin', 'Violet', NULL, '81 Judy Ave', 'Lr. Sackville', 'NS', 'B4F 1T6', '902 414 8857', NULL, 'coffinv8@gmail.com', '2025-01-01', 'Bob Harvey''s grandaughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (17, 17, 17, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 18: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (18, 'Individual', '2028-01-01', 1, '1984-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (18, 18, 1, 'Connolly', 'Christopher', 'Mr.', '56 St. Andrew''s Gardens', 'Toronto', 'ON', 'M4W 2E1', '416-927-9276', NULL, 'c.connolly@sympatico.ca', '1984-01-01', 'was  due Jan 2025 -paid 3 yrs in jan 24  so added 3yrs =Jan 28');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (18, 18, 18, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 19: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (19, 'Individual', '2026-01-01', 1, '1984-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (19, 19, 1, 'Connolly', 'Stephen H.', 'Dr.', '35 Willow Avenue', 'Rothesay', 'NB', 'E2H 2N5', '506-849-0827', NULL, 'conn@nbnet.nb.ca', '1984-01-01', 'son of Dennis');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (19, 19, 19, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 20: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (20, 'Individual', '2026-01-01', 1, '1995-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (20, 20, 1, 'Cosgrove', 'Anne', NULL, '11 Bluejay St.', 'Halifax', 'NS', 'B3M 1T9', '902-443-2421', NULL, 'anncosgrove@eastlink.ca', '1995-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (20, 20, 20, 9000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 21: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (21, 'Individual', '2027-01-01', 1, '1974-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (21, 21, 1, 'Cosgrove', 'Fr. Albert', 'Rev.', '6903 Mumford Road', 'Halifax', 'NS', 'B3L 2H5', '902-454-7103', NULL, 'albertcosgrovee@gmail.com', '1974-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (21, 21, 21, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 22: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (22, 'Individual', '2027-01-01', 1, '2018-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (22, 22, 1, 'Cosgrove', 'Ryan', NULL, '23 Rossi Drive', 'Dartmouth', NULL, 'B2X 3L7', '902-223-0266', NULL, 'rcosgrove@eastlink.ca', '2018-01-01', 'Relative of Fr. Albert');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (22, 22, 22, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 23: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (23, 'Individual', '2026-01-01', 1, '1997-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (23, 23, 1, 'Coughlan', 'C. Richard', 'Justice', '23 Glen Eagle Way', 'Halifax', 'NS', 'B3N 3H9', '902-425-3840', NULL, NULL, '1997-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (23, 23, 23, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 24: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (24, 'Individual', '2029-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (24, 24, 1, 'Coyle', 'Janice', 'Mrs.', '6 Dover Ct.', 'Stillwater Lake', NULL, 'B3Z1G2', '902 826 7732', NULL, 'janicecoyle@hotmail.com', '2024-01-01', 'Blair Beed paid for her in 2026 for 3 years');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (24, 24, 24, 6000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 25: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (25, 'Individual', '2025-01-01', 1, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (25, 25, 1, 'Cranston', 'Marla', NULL, '15 Rocklyn Road', 'Halifax', NULL, 'B3P 2H8', '902-818-9988', '902 210 5547', 'marla.cranston@smu.ca', '2019-01-01', NULL);

-- Membership 26: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (26, 'Individual', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (26, 26, 1, 'Dexter', 'Roberta', NULL, '244 Buckingham Dr.', 'Stillwater Lake', 'NS', 'B3Z 1G8', '902 802 9793', NULL, 'roberta@strategicmeetingdesigns.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (25, 26, 26, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 27: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (27, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (27, 27, 1, 'Doherty', 'Brendan', 'Mr.', '17 Keating Rd.', 'Halifax', 'NS', 'B3N 2N4', '902 222 5869', NULL, 'brendan@oldtriangle.com', '2025-01-01', 'Brian''s son');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (26, 27, 27, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 28: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (28, 'Individual', '2026-01-01', 1, '1976-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (28, 28, 1, 'Doherty', 'Michael', 'Mr.', '5515 Carriageway Crescent', 'Halifax', 'NS', 'B3K 5K4', '902-454-9199', NULL, 'michaeldoherty9@hotmail.com', '1976-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (27, 28, 28, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 29: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (29, 'Individual', '2026-01-01', 1, '1995-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (29, 29, 1, 'Donahoe', 'Lynne', 'Mrs.', '459 Power''s Road, White''s Lake', 'Halifax', NULL, 'B3T 1W6', '902 852 4367', NULL, 'lynnedonahoe@gmail.com', '1995-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (28, 29, 29, 6000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 30: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (30, 'Individual', '2026-01-01', 1, '1968-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (30, 30, 1, 'Donahoe, K.C.', 'Arthur', 'Mr.', 'Apt.506  5733 College St', 'Halifax.', 'NS', 'B3H 0B3', '902-422-7937', NULL, 'adonahoe@eastlink.ca', '1968-01-01', 'Pres. ''78');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (29, 30, 30, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 31: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (31, 'Individual', '2027-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (31, 31, 1, 'Donovan', 'Shannon', 'Ms.', '10 Blue Jay Lane', 'hammonds Plains', NULL, 'B3Z 1J1', '902 789 6176', NULL, 'shannon.donovan@gmail.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (30, 31, 31, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 32: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (32, 'Individual', '2026-01-01', 1, '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (32, 32, 1, 'Downie', 'Adam', NULL, '86 Castlepark Grove', 'Halifax', 'NS', 'B3M 4X9', '902-444-6577', NULL, 'downie-adam@hotmail.com', '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (31, 32, 32, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 33: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (33, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (33, 33, 1, 'Downie', 'Conor P', 'Mr.', 'Unit 1107 1319 – 14 Ave. SW', 'Calgary, Alberta', NULL, 'T3C 0W3', NULL, NULL, 'conordownie@hotmail.com', '2025-01-01', 'Kevin''s son');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (32, 33, 33, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 34: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (34, 'Individual', '2026-01-01', 1, '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (34, 34, 1, 'Downie', 'Elizabeth Ann', NULL, '86 Castlepark Grove', 'Halifax', 'NS', 'B3M 4X9', '902-444-6577', NULL, 'beth_downie@hotmail.com', '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (33, 34, 34, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 35: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (35, 'Individual', '2026-01-01', 1, '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (35, 35, 1, 'Downie', 'Erin Marie', NULL, '86 Castlepark Grove', 'Halifax', 'NS', 'B3M 4X9', '902-444-6577', NULL, NULL, '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (34, 35, 35, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 36: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (36, 'Individual', '2026-01-01', 1, '1979-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (36, 36, 1, 'Downie', 'Kevin', 'Mr.', '33 Lister Drive', 'Bedford', 'NS', 'B4A 2M4', '902-835-5564', NULL, 'kpdownie@accesswave.ca', '1979-01-01', 'Pres. ''96');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (35, 36, 36, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 37: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (37, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (37, 37, 1, 'Downie', 'James W', 'Mr.', 'Suite 204 1581 South Park Street,', 'Halifax', 'NS', 'B3J 0H1', NULL, NULL, 'James-downie@hotmail.com', '2025-01-01', 'Kevin''s son');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (36, 37, 37, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 38: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (38, 'Individual', '2027-01-01', 1, '1965-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (38, 38, 1, 'Doyle', 'Donald', 'Mr.', '3156 Aitkens Ave.', 'Halifax', 'NS', 'B3L 3Y4', '902-454-7235', NULL, NULL, '1965-01-01', 'plays in band wife died oct 2023 wife claire 25 3 .23 garrison');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (37, 38, 38, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 39: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (39, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (39, 39, 1, 'Drisdelle', 'Suzanne', 'Ms.', '3242 Beresford Rd.', 'Halifax', 'NS', 'B3L #r8', '343-573-6195', NULL, 'suzanne.drisdelle@gmail.com', '2025-01-01', 'Foreign Serv. Officer Diplomat');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (38, 39, 39, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 40: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (40, 'Individual', '2026-01-01', 1, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (40, 40, 1, 'Dunbrack', 'Patty', NULL, '44 Circassion Drive', 'Dartmouth', NULL, 'B2W 4N3', '902-222-6925', NULL, 'yttap11@gmail.com', '2019-01-01', 'email glitch');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (39, 40, 40, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 41: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (41, 'Individual', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (41, 41, 1, 'Elliott', 'Donna Mary', NULL, 'Carlson Wagonlit Travel', 'Halifax', 'NS', NULL, '902.425.3200', NULL, 'delliott@harveystravel-cwt.com', '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (40, 41, 41, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 42: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (42, 'Individual', '2027-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (42, 42, 1, 'Faherty', 'Ciaran Thomas', NULL, '3 Digby Crescent', 'Dartmouth', 'NS', 'B2W 2G1', '902-293-6429.', NULL, 'ciaran.faherty53@gmail.com', '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (41, 42, 42, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 43: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (43, 'Individual', '2027-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (43, 43, 1, 'Findlay', 'Barbara', NULL, '5508 Hennessey Place', 'Halifax', NULL, 'B3K 2A8', '902 440 9524', NULL, 'bfindlay@eastlink.ca', '2014-01-01', 'Dtr was schoolar recept in 2014');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (42, 43, 43, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 44: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (44, 'Individual', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (44, 44, 1, 'Fitzpatrick', 'Heather', 'Mrs.', '63 Downs Ave.', 'Halifax', 'NS', 'B3N 2Z2', '902 777 7851', NULL, 'heather.fitz902@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (43, 44, 44, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 45: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (45, 'Individual', '2026-01-01', 1, '1995-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (45, 45, 1, 'Fitzpatrick', 'John', 'Mr.', '63 Downs Ave.', 'Halifax', 'NS', 'B3N 2Z1', '902-477-7851', NULL, 'jfitzpatrick@boyneclarke.ca', '1995-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (44, 45, 45, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 46: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (46, 'Individual', '2027-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (46, 46, 1, 'Flanagan', 'Sharon', NULL, '303 - 162 Ochterloney', 'Dartmouth', 'NS', 'B2Y 4X3', '902 478 8527', NULL, 'flan.ny@hotmail.com', '2016-01-01', 'Dept of Justice');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (45, 46, 46, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 47: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (47, 'Individual', '2027-01-01', 1, '1980-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (47, 47, 1, 'Flemming', 'Jack', 'Mr.', '11 Springvale Avenue #410', 'Halifax', 'NS', 'B3N 2A3', '902-443-2584', NULL, 'jack@oceancontractors.ca', '1980-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (46, 47, 47, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 48: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (48, 'Individual', '2027-01-01', 1, '2005-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (48, 48, 1, 'Fougere', 'Sheila', NULL, '2743 Dublin St', 'Halifax', 'NS', 'B3L 3K1', '902-471-7315', NULL, 'skfougere@gmail.com', '2005-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (47, 48, 48, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 49: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (49, 'Individual', '2027-01-01', 1, '2018-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (49, 49, 1, 'Gibling', 'Ellen', NULL, '2616 Fuller Terrace', 'Halifax', 'NS', 'B3K 3V7', '902 789 7632', NULL, 'ellengibling@hotmail.com', '2018-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (48, 49, 49, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 50: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (50, 'Individual', '2027-01-01', 1, '1994-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (50, 50, 1, 'Giles, K.C.', 'C. Gavin', 'Mr.', '17 Glen Eagle Way', 'Halifax', 'NS', 'B3N 3H9', '902-423-9131', '478 2887', 'gavin.giles@mcinnescooper.com', '1994-01-01', 'Pres. ''99');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (49, 50, 50, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 51: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (51, 'Individual', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (51, 51, 1, 'Grant', 'Patricia', NULL, '156 Purcell''s Cove Road', 'Halifax', 'NS', 'B3P 1B6', '902-479-3735', NULL, NULL, '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (50, 51, 51, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 52: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (52, 'Individual', '2026-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (52, 52, 1, 'Grant', 'Richard R. (Rick)', NULL, '156 Purcell''s Cove Road', 'Halifax', 'NS', 'B3P 1B6', '902-479-3735', NULL, 'rrg@eastlink.ca', '2014-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (51, 52, 52, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 53: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (53, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (53, 53, 1, 'Greene', 'Beth', NULL, '30 Smallwood Avenue', 'Loon Lake', NULL, 'B2W 3R5', NULL, NULL, 'bgreenedance@gmail.com', '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (52, 53, 53, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 54: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (54, 'Individual', '2027-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (54, 54, 1, 'Greiner', 'Erik', NULL, '214 School Street,', 'Dartmouth', NULL, 'B3A 2Y4', '902-999-1150', NULL, 'erik.greiner@gmail.com', '2016-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (53, 54, 54, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 55: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (55, 'Individual', '2026-01-01', 1, '1992-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (55, 55, 1, 'Harvey', 'Carollyn', 'Mrs.', '272 Hallmark Avenue', 'Lr Sackville', 'NS', 'B4C 3R1', '902-864-4160', NULL, NULL, '1992-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (54, 55, 55, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 56: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (56, 'Individual', '2026-01-01', 1, '2000-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (56, 56, 1, 'Havey', 'Margaret', 'Mrs.', '6125 Allan Street', 'Halifax', 'NS', 'B3J 1G7', '902-427-0550', NULL, 'mhavey1@gmail.com', '2000-01-01', 'father Clinton Pres, ''60');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (55, 56, 56, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 57: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (57, 'Individual', '2026-01-01', 1, '1992-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (57, 57, 1, 'Hillyard', 'Amy', 'Mrs.', '44 Mayflower Lane', 'Box71D RR#3 Tusket', 'NS', 'B0W3M0', '902-740-0349', NULL, 'amy@wastecheck.ca', '1992-01-01', 'Bob and Carollyn Harvey''s daughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (56, 57, 57, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 58: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (58, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (58, 58, 1, 'Hillyard', 'Lillian', 'Ms.', '45 Mayflower Lane', 'Box71D RR#3 Tusket', 'NS', 'B0W3M0', '902 512 0009', NULL, 'lillyanhilly@gmail.com', '2025-01-01', '''''  '''' grandaughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (57, 58, 58, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 59: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (59, 'Individual', '2029-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (59, 59, 1, 'Hopper', 'Laura', NULL, '148 Rosedale Avenue', 'Halifaax.', 'NS', 'B3N 2J8', '902-440-6894', NULL, 'hopperlauram@gmail.com', '2016-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (58, 59, 59, 8000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 60: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (60, 'Individual', '2026-01-01', 1, '2001-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (60, 60, 1, 'Hotchkiss', 'Keith', 'Mr.', '35 Canary Crescent', 'Halifax', 'NS', 'B3M 1R2', '902-445-3021', NULL, 'keith_hotch@hotmail.com', '2001-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (59, 60, 60, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 61: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (61, 'Individual', '2026-01-01', 1, '2009-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (61, 61, 1, 'Kelley', 'R. Robert', NULL, '5561 Heatherwood Crt. Apt 102', 'Halifax', 'NS', 'B3K 5N7', '902-454-7654', NULL, 'rrkhfx@gmail.com', '2009-01-01', 'St Pats dinner Rhonda O''Donnell');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (60, 61, 61, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 62: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (62, 'Individual', '2027-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (62, 62, 1, 'Kenny', 'Mark', 'Mr.', '45 Bayview Rd.', 'Halifax', 'NS', 'B3M1N8', '902 449 5855', NULL, 'mark@southportasset.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (61, 62, 62, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 63: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (63, 'Individual', '2026-01-01', 1, '1997-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (63, 63, 1, 'Knickle', 'Jean', NULL, '96 Brook St.,', 'Halifax', 'NS', 'B3N 3C8', '902-479-2943', NULL, NULL, '1997-01-01', 'No email. Would prefer to be mailed or called.');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (62, 63, 63, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 64: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (64, 'Individual', '2026-01-01', 1, '1993-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (64, 64, 1, 'Lafferty, K.C.', 'Lorraine', 'Ms.', '2770 Doug Smith Drive', 'Halifax', 'NS', 'B3L 3T5', '902-454-2488', NULL, 'lplafferty01@gmail.com', '1993-01-01', 'Pres. ''04');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (63, 64, 64, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 65: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (65, 'Individual', '2027-01-01', 1, '1976-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (65, 65, 1, 'Lanigan', 'John', 'Mr.', '315 Milson Street', 'Halifax', 'NS', 'B3N 2C3', '902-477-3683', NULL, 'john.lanigan@ns.sympatico.ca', '1976-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (64, 65, 65, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 66: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (66, 'Individual', '2026-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (66, 66, 1, 'Larkin', 'Una', NULL, '306-324 Larry Uteck Blvd', 'Halifax', 'NS', 'B3M 0E7', '902 329 4129', NULL, 'irlande55@yahoo.ca', '2020-01-01', 'formerly "Una G Nordqvist"');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (65, 66, 66, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 67: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (67, 'Individual', '2026-01-01', 1, '1985-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (67, 67, 1, 'Larsen', 'Michael', 'Dr.', '1 Craigmore Dr suite  1101', 'Halifax', 'NS', 'B3N 0C6', '902-423-7645', NULL, 'michaeljosephlarsen@gmail.com', '1985-01-01', 'Pres. ''00');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (66, 67, 67, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 68: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (68, 'Individual', '2026-01-01', 1, '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (68, 68, 1, 'MacDonald', 'Elizabeth', NULL, '5530 Columbus Place', 'Halifax', 'NS', 'B3K 2G8', '902-454-3015', NULL, 'acappella2002@gmail.com', '2011-01-01', 'Pres. 2016-2017');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (67, 68, 68, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 69: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (69, 'Individual', '2027-01-01', 1, '1999-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (69, 69, 1, 'MacGillivary', 'Ann', NULL, '291 Radcliffe Drive Apt 203', 'Halifax', 'NS', 'B3S 1H8', '902-223-7105', NULL, 'macgillivaryac50@gmail.com', '1999-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (68, 69, 69, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 70: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (70, 'Individual', '2026-01-01', 1, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (70, 70, 1, 'MacIsaac-Williams', 'Jennifer', NULL, '231 Daisywood Drive', 'Hammonds Plains', 'NS', 'B4B 0E2', '902-489-5519', NULL, 'sine_nic@eastlink.ca', '2022-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (69, 70, 70, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 71: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (71, 'Individual', '2027-01-01', 1, '2000-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (71, 71, 1, 'MacKay', 'Anne', NULL, '5528 Merkel Place', 'Halifax', 'NS', 'B3K 2H8', '902-455-4506', NULL, 'annemackay@bellaliant.net', '2000-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (70, 71, 71, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 72: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (72, 'Individual', '2026-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (72, 72, 1, 'Maguire, MLA', 'Brendan', 'Mr', '349 Herring Cove Rd.', 'Halifax', 'NS', 'B3R 1V9', '902 444 0147', NULL, 'brendanmaguire@gmail.com', '2016-01-01', 'brendan@brendanmaguire.ca');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (71, 72, 72, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 73: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (73, 'Individual', '2026-01-01', 1, '1985-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (73, 73, 1, 'Mantin', 'Ken', 'Mr.', 'Apt 312-187 Kaulback St', 'Truro', 'NS', 'B2N 0C4', '902-454-4662', NULL, 'kmantin@eastlink.ca', '1985-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (72, 73, 73, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 74: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (74, 'Individual', '2026-01-01', 1, '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (74, 74, 1, 'Martell', 'Barbara', NULL, '5514 Stoneham Court', 'Halifax', 'NS', 'B3K4A5', NULL, NULL, 'bmartell5514@gmail.com', '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (73, 74, 74, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 75: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (75, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (75, 75, 1, 'Mason', 'Liam', NULL, '5662 Fenwick Street, Apt 2', 'Halifax', 'NS', 'B3H 1R3', '902 297 1111', NULL, 'liam.mason@smu.ca', '2023-01-01', 'smu student did NI peace pgme');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (74, 75, 75, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 76: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (76, 'Individual', '2027-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (76, 76, 1, 'Mason', 'Waye', NULL, '1580 Vernon St.', 'Halifax', 'NS', 'B3H3M6', '782 234 2458', '902-430-7822', 'wayemason@pm.me', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (75, 76, 76, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 77: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (77, 'Individual', '2027-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (77, 77, 1, 'Mathers', 'Melissa', 'Ms.', '11 Raithpark Lane', 'Halifax', 'NS', 'B3P 0B5', '902 456 6057', NULL, 'mmathers@ihmathers.com', '2025-01-01', 'Harry''s daughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (76, 77, 77, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 78: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (78, 'Individual', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (78, 78, 1, 'McCabe', 'Eugene', NULL, '5722 Willow Street', 'Halifax', 'NS', 'B3K 1L7', '902-877-2746', NULL, 'mccabeeug@gmail.com', '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (77, 78, 78, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 79: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (79, 'Individual', '2027-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (79, 79, 1, 'McCallum', 'Sheila', NULL, '19 Laurier Street', 'Dartmouth', 'NS', 'B3A 2G6', '902-466-2611', NULL, 'mike_janesmum@hotmail.com', '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (78, 79, 79, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 80: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (80, 'Individual', '2025-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (80, 80, 1, 'McCarron', 'Alice', NULL, '6260 Pepperell Street', 'Halifax', 'NS', 'B3H 0C5', '902 403 7607', NULL, 'mccarronalice@gmail.com', '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (79, 80, 80, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 81: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (81, 'Individual', '2025-01-01', 1, '2005-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (81, 81, 1, 'McCluskey', 'Gloria', 'Mrs.', '215 Victoria Road', 'Dartmouth', 'NS', 'B3A 1W5', '902-466-3936', NULL, 'gloriamccluskey@eastlink.ca', '2005-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (80, 81, 81, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 82: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (82, 'Individual', '2027-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (82, 82, 1, 'McGrath', 'Eadaoin', NULL, '1183 South Park St.', 'Halifax', 'NS', 'B3H 2W11', '902 440 4556', NULL, 'eadaoinmcgrath7250@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (81, 82, 82, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 83: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (83, 'Individual', '2027-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (83, 83, 1, 'McGrath', 'Mairead', NULL, '1181 South Park St.', 'Halifax', 'NS', 'B3H 2W9', '902 233 3266', NULL, 'maireadlouiseking@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (82, 83, 83, 12000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 84: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (84, 'Individual', '2027-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (84, 84, 1, 'McGrath', 'Sarah', NULL, '1182 South Park St.', 'Halifax', 'NS', 'B3H 2W10', '902 412 8511', NULL, 'sarah_louisemc@icloud', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (83, 84, 84, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 85: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (85, 'Individual', '2027-01-01', 1, '2007-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (85, 85, 1, 'McManus', 'Jacqueline', 'Mrs.', 'The Nines at Brunello, 321-7 Brunello Blvd,', 'Timberlea', 'NS', 'B3T 0J6', '902-434-7550', NULL, 'belfast@eastlink.ca', '2007-01-01', 'widow Hugie McManus');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (84, 85, 85, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 86: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (86, 'Individual', '2027-01-01', 1, '2009-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (86, 86, 1, 'Meade', 'Drew', 'Mr.', '28 Hebridean Drive', 'Herring Cove', 'NS', 'B3V 1H3', '902-229-2396', NULL, 'drew.meade@live.com', '2009-01-01', 'Grandson');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (85, 86, 86, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 87: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (87, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (87, 87, 1, 'Molloy', 'Edward', 'Prof.', '923 Robie St,', 'Halifax', 'NS', 'B3H 3C3', '902-440-9080', NULL, 'edward.molloy@smu.ca', '2025-01-01', 'c/o Irish Studies Bruig');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (86, 87, 87, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 88: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (88, 'Individual', '2028-01-01', 1, '1983-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (88, 88, 1, 'Moore, K.C.', 'Sen.Wilfred', 'Sen.', 'Box 500, 69 Nauss Pt.Rd.', 'Chester', 'NS', 'BOJ 1J0', '902-275-4834', NULL, 'wpmhabs4@gmail.com', '1983-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (87, 88, 88, 10000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 89: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (89, 'Individual', '2022-01-01', 1, '1996-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (89, 89, 1, 'Morris', 'Christopher', 'Mr.', '15 Fleming Drive', 'Halifax', 'NS', 'B3P 1A8', '902-479-0392', NULL, NULL, '1996-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (88, 89, 89, 2000, 'etransfer', '2021-01-01', 2021, NULL);

-- Membership 90: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (90, 'Individual', '2026-01-01', 1, '1984-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (90, 90, 1, 'Morrison', 'James', 'Dr.', '6289 Yale Street', 'Halifax', 'NS', 'B3L 1C9', '902-429-8094', NULL, 'James.Morrison@smu.ca', '1984-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (89, 90, 90, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 91: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (91, 'Individual', '2025-01-01', 1, '2005-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (91, 91, 1, 'Murphy', 'C. James', 'Mr.', '658 Old Sackville Rd.', 'Lower Sackville', 'NS', 'B4C 2K3', '902-865-2297', NULL, 'jim.murphy@ns.sympatico.ca', '2005-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (90, 91, 91, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 92: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (92, 'Individual', '2027-01-01', 1, '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (92, 92, 1, 'Niedermayer', 'Cathleen', 'Mrs.', '104-1044 Tower Rd.', 'Halifax', 'NS', 'B3H 4R1', '902-491-7620', NULL, 'cathleen@bellaliant.net', '2003-01-01', 'sister of Art Donohoe');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (91, 92, 92, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 93: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (93, 'Individual', '2026-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (93, 93, 1, 'Nolen', 'John', 'Mr.', '107 Prospect Bay Road', 'Prospect Bay', 'NS', 'B3T 1Z4', '902-852-2195', NULL, 'jfnolen70@hotmail.com', '2014-01-01', 'Wife Margaret passed away in October 2019');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (92, 93, 93, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 94: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (94, 'Individual', '2026-01-01', 1, '1988-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (94, 94, 1, 'Nolen', 'Peter', 'Mr.', '6366 Berlin St.', 'Halifax', 'NS', 'B3L 1T5', '902-454-7000', NULL, NULL, '1988-01-01', 'no email send reg. mail');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (93, 94, 94, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 95: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (95, 'Individual', '2027-01-01', 1, '2007-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (95, 95, 1, 'O''Brien', 'Dr. Dan Michael', 'Dr.', '800-5991 Spring Garden Road', 'Halifax', 'NS', 'B3H 1Y6', '902-477-5094', NULL, 'dmobrien@dal.ca', '2007-01-01', 'Dr Brian O''Brien''s son');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (94, 95, 95, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 96: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (96, 'Individual', '2026-01-01', 1, '2007-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (96, 96, 1, 'O''Brien', 'Kathleen', 'Dr.', '1771 Connaught Avenue', 'Halifax', 'NS', 'B3H 4C9', '902-477-3441', NULL, 'mkobrien@dal.ca', '2007-01-01', 'Dr.Brians daughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (95, 96, 96, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 97: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (97, 'Individual', '2026-01-01', 1, '2007-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (97, 97, 1, 'O''Brien Edmonds, KC', 'Erin', NULL, '30 Hillwood Crescent', 'Halifax', 'NS', 'B3M 1J4', '902-443-2125', '902 478 9904', 'erinobrienedmonds@gmail.com', '2007-01-01', 'Dr.Brians daughter');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (96, 97, 97, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 98: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (98, 'Individual', '2028-01-01', 1, '1982-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (98, 98, 1, 'O''Connor', 'David', 'Mr.', '5 Shepherd Road', 'Halifax', 'NS', 'B3P 2K6', '902-477-0820', NULL, 'pollywog@hfx.eastlink.ca', '1982-01-01', 'cousin of the late Victor O''Connor');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (97, 98, 98, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 99: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (99, 'Individual', '2027-01-01', 1, '2018-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (99, 99, 1, 'O''Connor', 'Father Jim (E J)', 'Rev.', '669 Prince St', 'Truro', NULL, 'B2N 1G5', '902 893 7188', NULL, 'fatherjim@eastlink.ca', '2018-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (98, 99, 99, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 100: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (100, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (100, 100, 1, 'Odell', 'Margaret', NULL, '713-6969 Bayers Road', 'Halifa', 'NS', 'B3L 4P3', '902 718 9280', NULL, 'odemargaret@gmail.com', '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (99, 100, 100, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 101: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (101, 'Individual', '2026-01-01', 1, '2008-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (101, 101, 1, 'O''Donnell', 'Rhonda Carroll', 'Ms.', '5561 Heatherwood Crt. Apt.102', 'Halifax', 'NS', 'B3K 5N7', '902 471 7089', NULL, 'rhonda.odo@gmail.com', '2008-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (100, 101, 101, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 102: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (102, 'Individual', '2026-01-01', 1, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (102, 102, 1, 'O''Keefe', 'Sister Joan', NULL, '101-3000 Olivet Street', 'Halifax', NULL, NULL, '902-475-3609', NULL, 'jokeefesc@gmail.com', '2019-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (101, 102, 102, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 103: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (103, 'Individual', '2026-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (103, 103, 1, 'O''Leary', 'Deborah', NULL, '39 Matador Court', 'Lr. Sackville', 'NS', 'B4C 3G9', '902-865-0438', NULL, 'dtoleary@eastlink.ca', '2016-01-01', 'donation $100 12/1/24');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (102, 103, 103, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 104: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (104, 'Individual', '2027-01-01', 1, '1990-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (104, 104, 1, 'O''Malley', 'Paul', 'Mr.', '256 Radcliffe Dr.', 'Halifax', 'NS', 'B3S 1E4', '902-445-2610', NULL, NULL, '1990-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (103, 104, 104, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 105: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (105, 'Individual', '2026-01-01', 1, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (105, 105, 1, 'O''Sullivan', 'Karen', NULL, '224 Warwick Mountain', 'Colchester County', NULL, 'B0K1V0', '902 471 7882', NULL, 'karenosullivan82@gmail.com', '2022-01-01', 'not connected with Neil Morley anymore');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (104, 105, 105, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 106: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (106, 'Individual', '2026-01-01', 1, '2005-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (106, 106, 1, 'Patterson', 'Anne Marie', 'Mrs.', '474 Ridge Road', 'Wolfville', 'NS', 'B4P 2R1', NULL, NULL, 'amjpatterson@gmail.com', '2005-01-01', 'John was Pres');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (105, 106, 106, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 107: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (107, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (107, 107, 1, 'Pelton', 'Rosanna', NULL, '5A MacKenzie St.', 'Dartmouth', 'NS', 'B2W1B1', '902 401 3576', NULL, NULL, '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (106, 107, 107, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 108: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (108, 'Individual', '2026-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (108, 108, 1, 'Penny', 'Stephen', NULL, '16 Anchor Drive, Apt. B104,', 'Halifax.', 'NS', 'B3N 3G1', '902 454 7191', '902 483 8741', 'banjoman@ns.sympatico.ca', '2020-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (107, 108, 108, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 109: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (109, 'Individual', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (109, 109, 1, 'Pottie', 'Rita M. & Frank', NULL, '7 Bowser Ave.', 'Dartmouth', 'NS', 'B2W 1L8', '902-462-4764', NULL, 'frank-rita.pottie@ns.sympatico.ca', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (108, 109, 109, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 110: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (110, 'Individual', '2026-01-01', 1, '2002-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (110, 110, 1, 'Power', 'Eileen J', NULL, '5293 Green St. Apt. 306', 'Halifax', 'NS', 'B3H 1N6', '902-420-9979', '902-293- 8193', 'eileenpower@hotmail.com', '2002-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (109, 110, 110, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 111: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (111, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (111, 111, 1, 'Quill', 'Eamon', 'Mr.', '1249 Church St. Unit 1', 'Halifax', 'NS', 'B3J 2E9', '705 305 6975', NULL, 'eamonquill@gmail.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (110, 111, 111, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 112: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (112, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (112, 112, 1, 'Ross', 'Kate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (111, 112, 112, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 113: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (113, 'Individual', '2026-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (113, 113, 1, 'Rowe', 'Joanne', NULL, '201-12 Spinnaker Drive', 'Halifax', 'NS', 'B3N 3A8', '902 492 2864', NULL, 'joanneprowe@gmail.com', '2020-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (112, 113, 113, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 114: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (114, 'Individual', '2027-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (114, 114, 1, 'Rushe', 'Michael', NULL, '1064 Bland Street', 'Halifax', 'NS', 'B3H 2S8', '902-423-4117', NULL, 'michael.rushe@dal.ca', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (113, 114, 114, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 115: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (115, 'Individual', '2027-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (115, 115, 1, 'Russell', 'Merv', NULL, '22 Litchfield Cres.', 'Halifax', 'NS', 'B3P 2N3', '902 477 8580', NULL, 'merv.russell@mbsradio.com', '2023-01-01', 'MBS Radio');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (114, 115, 115, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 116: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (116, 'Individual', '2026-01-01', 1, '1986-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (116, 116, 1, 'Ryan', 'Frank', 'Mr.', '219 28th Avenue NW.', 'Hickory, N.C.', 'USA', '28601', '828-324-4417', '828 302 7443', 'frank.s.ryan@nexans.com', '1986-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (115, 116, 116, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 117: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (117, 'Individual', NULL, 1, '1970-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (117, 117, 1, 'Ryan, K.C. LM', 'Michael', 'Mr.', '1530 Oxford Street', 'Halifax', 'NS', 'B3H 3Z2', '902-422-6656', NULL, 'michael.ryan@ryanlegalservices.ca', '1970-01-01', '50 Years 2020');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (116, 117, 117, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 118: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (118, 'Individual', '2026-01-01', 1, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (118, 118, 1, 'Ryding', 'Helen', NULL, '401 - 5881 Spring Garden Road', 'Halifax', NULL, 'B3H 4S3', '902 429-5451', NULL, 'helen.ryding@dal.ca', '2021-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (117, 118, 118, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 119: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (119, 'Individual', '2026-01-01', 1, '2010-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (119, 119, 1, 'Samson', 'Garvie (Gervais)', NULL, '36 Lawnsdale Drive', 'Dartmouth', 'NS', 'B3A 2N4', '902-464-9734', NULL, 'samsong@eastlink.ca', '2010-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (118, 119, 119, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 120: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (120, 'Individual', '2027-01-01', 1, '1996-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (120, 120, 1, 'Scott', 'Pauline', NULL, '6311 Allan Street.', 'Halifax.N.S', NULL, 'B3L 1G8', '902-425-5466', NULL, 'pmscott47@gmail.com', '1996-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (119, 120, 120, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 121: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (121, 'Individual', '2027-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (121, 121, 1, 'Sears', 'Michael (Mike)', NULL, '47 Medford Street', 'Dartmouth', 'NS', 'B2Y 1T6', '902-789-9272', NULL, 'sears88_2000@yahoo.com', '2015-01-01', 'paid for by Sharon F');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (120, 121, 121, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 122: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (122, 'Individual', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (122, 122, 1, 'Shanahan', 'Dawn', 'Mrs.', '7 Ternan Gate', 'Bedford', 'NS', 'B4A 0G9', '902 448 5321', NULL, 'dawnshanahan2@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (121, 122, 122, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 123: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (123, 'Individual', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (123, 123, 1, 'Shanahan', 'Rory', 'Mr.', '6 Ternan Gate', 'Bedford', 'NS', 'B4A 0G8', '902 986 7717', NULL, 'rory.shanahan@simplybluegroup.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (122, 123, 123, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 124: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (124, 'Individual', '2026-01-01', 1, '1978-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (124, 124, 1, 'Slaney', 'Patrick', 'Mr.', '#601 - 2630 Gottingen St', 'Halifax', 'NS', 'B3K 3C6', '902-444-0610.', NULL, 'kl.555@hotmail.com', '1978-01-01', 'Email -  kl.555@hotmail.com - belongs to Kathleen O''Reilly. Prefers to receive info by mail, as he has no computer');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (123, 124, 124, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 125: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (125, 'Individual', '2025-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (125, 125, 1, 'Smyth', 'Colin', 'Mr.', '74 Sloane Court', 'Hammomds Plains', 'NS', 'B4B 2A4', '902-399-4610', NULL, 'colin_smyth@outlook.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (124, 125, 125, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 126: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (126, 'Individual', '2028-01-01', 1, '2009-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (126, 126, 1, 'Soward', 'Clifford', NULL, '17 Westgate Drive', 'Halifax', 'NS', 'B3P 1T7', '902-477-0543', NULL, 'csoward@bellaliant.net', '2009-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (125, 126, 126, 6000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 127: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (127, 'Individual', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (127, 127, 1, 'Sutow', 'Pauline', NULL, '1388 Purcell''s Cove Road, Apt705', 'Halifax', NULL, 'B3K 0K8', '902 329 5220', NULL, 'pauline.sutow@alumni.utoronto.ca', '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (126, 127, 127, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 128: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (128, 'Individual', '2026-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (128, 128, 1, 'Underhill', 'Kathleen', NULL, '1640 Cambridge Street', 'Halifax', 'NS', 'B3H 4A7', NULL, NULL, 'Kathleenunderhill11@gmail.com', '2014-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (127, 128, 128, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 129: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (129, 'Individual', '2025-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (129, 129, 1, 'Uteck', 'Sue', NULL, '770 McLean Street', 'Halifax', 'NS', 'B3H 2T8', '902 817 1848', NULL, 'suzanneuteck@gmail.com', '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (128, 129, 129, 2000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 130: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (130, 'Individual', '2027-01-01', 1, '2006-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (130, 130, 1, 'Walker', 'Joanne', 'Ms.', '23 Blue Forest Lane', 'Hammonds Plains', 'NS', 'B4B 1L1', '902-832-6241', NULL, 'joannewalker87@hotmail.com', '2006-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (129, 130, 130, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 131: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (131, 'Individual', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (131, 131, 1, 'Walker', 'Kieran', NULL, '1064 Barrington St', 'Halifax', 'NS', NULL, '782-234-0280', NULL, 'Kieranpwalker@icloud.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (130, 131, 131, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 132: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (132, 'Individual', '2026-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (132, 132, 1, 'Walsh', 'Patricia Anne', NULL, '810 - 6967 Bayers Road', 'Halifax', 'NS', 'B3L 4P2', '902-405-5903', '902-479-3474', 'pabwalsh@gmail.com', '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (131, 132, 132, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 133: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (133, 'Individual', '2028-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (133, 133, 1, 'Wedge', 'Paula M.', NULL, 'PO Box 273, 22 Vaughan Road', 'Western Shore', 'NS', 'B0J 3M0', '902-221-5028', NULL, 'wedgepm@gmail.com', '2020-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (132, 133, 133, 6000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 134: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (134, 'Individual', '2028-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (134, 134, 1, 'White', 'Derek', NULL, 'Box 415, Central', 'Halifax', 'NS', 'B3J 2P8', '902-476-3065', NULL, 'whitey443@gmail.com', '2015-01-01', 'pd via Erik');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (133, 134, 134, 6000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 135: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (135, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (135, 135, 1, 'Williams', 'Macsen', NULL, '231 Daisywood Drive', 'Hammonds Plains', 'NS', 'B4B 0E2', '902-489-5519', NULL, NULL, '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (134, 135, 135, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 136: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (136, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (136, 136, 1, 'Williams', 'Rhian', NULL, '231 Daisywood Drive', 'Hammonds Plains', 'NS', 'B4B 0E2', '902-489-5519', NULL, NULL, '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (135, 136, 136, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 137: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (137, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (137, 137, 1, 'Williams', 'Rhodri (18)', NULL, '231 Daisywood Drive', 'Hammonds Plains', 'NS', 'B4B 0E2', '902-489-5519', NULL, NULL, '2023-01-01', 'jennifer from CBI - Husb is fr, Wales');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (136, 137, 137, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 138: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (138, 'Individual', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (138, 138, 1, 'Woods', 'Rachel', NULL, '363 - 281 Windmill Rd.', 'Dartmouth', 'NS', 'B3A 4P9', '902 412 7147', NULL, 'rachaelwoods@liberated.ca', '2023-01-01', 'RCMP');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (137, 138, 138, 2000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 139: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (139, 'Individual', '2027-01-01', 1, '2026-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (139, 139, 1, 'O''neil', 'Gavin', 'Mr', '47 Jackladder Dr', 'Middle Sackville', 'NS', 'B4E 2X6', '647-997-4992', NULL, 'oneilg25@gmail.com', '2026-01-01', 'Corporate Investment Management');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (138, 139, 139, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 140: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (140, 'Individual', '2027-01-01', 1, '2026-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (140, 140, 1, 'Campbell', 'Sherri', NULL, '75 Crosswell Crt', 'Hammonds Plains', 'NS', 'B3Z 0M5', NULL, '902-448-7016', 'slcurley@hotmail.com', '2026-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (139, 140, 140, 2000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 141: Individual
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (141, 'Individual', '2029-01-01', 1, '2026-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (141, 141, 1, 'Rivest', 'Joanne', NULL, '52 Lancaster Drive', 'Dartmouth', 'NS', NULL, '902-433-3011', '902-225-3490', 'jojo305@yahoo.ca', '2026-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (140, 141, 141, 6000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 142: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (142, 'Couple', '2026-01-01', 1, '2025-01-01', 'No address on file - payee only');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (142, 142, 1, 'Kennedy', 'John', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (143, 142, 0, 'Kennedy', 'Martina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (141, 142, 142, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 143: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (143, 'Couple', '2025-01-01', 1, '2011-01-01', 'No address on file - payee only');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (144, 143, 1, 'Shaftel', 'Ann', NULL, NULL, NULL, NULL, 'B3H 2N3', '902-422-2327', NULL, 'annshaftel@gmail.com', '2011-01-01', 'treasurecaretaker@icloud.com');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (142, 143, 144, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 144: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (144, 'Couple', '2027-01-01', 1, '1986-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (145, 144, 1, 'Downie Sullivan', 'Jennifer A.', 'Mrs.', '101 Roxbury Crescent', 'Halifax', 'NS', 'B3M 4S9', '902-835-5518', NULL, 'jenndownie@hotmail.com', '2008-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (146, 144, 0, 'Sullivan', 'John K.', 'Mr.', '101 Roxbury Crescent', 'Halifax', 'NS', 'B3M 4S9', '902 835 5518', '902 789 5518', 'jksullivan@eastlink.ca', '1986-01-01', 'Pres. ''98');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (143, 144, 145, 3000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 145: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (145, 'Couple', '2026-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (147, 145, 1, 'Holland', 'Ronan', NULL, '3528 Purcells Cove Rd,', 'Halifax.', 'NS', 'B3V 1G3', '902-455-4991', '902-469-2421', 'ronan.w.holland@gmail.com', '2014-01-01', 'rholland@weldonmcinnis.ca');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (148, 145, 0, 'Holland', 'Shelley Joyce', NULL, '3529 Purcells Cove Rd,', 'Halifax', 'NS', 'B3V 1G4', NULL, NULL, 's.f.d.joyce@hotmail.com', '2024-01-01', NULL);

-- Membership 146: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (146, 'Couple', '2027-01-01', 1, '2004-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (149, 146, 1, 'Brownlow', 'Sean', 'Mr.', '7 Limardo Drive', 'Dartmouth', 'NS', 'B3A 3X2', '902 497 5030', NULL, 'ovation04@icloud.com', '2004-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (150, 146, 0, 'Brownlow', 'Michelle', NULL, '7 Limardo Drive', 'Dartmouth', 'NS', 'B3A 3X2', NULL, NULL, NULL, '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (144, 146, 149, 3000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 147: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (147, 'Couple', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (151, 147, 1, 'Butler', 'Rick', 'Mr.', '1509-6140 Young Street', 'Halifax', 'NS', 'B3K 0G2', '902-455-9414', NULL, 'rc.butler@ns.sympatico.ca', '2015-01-01', 'knows');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (152, 147, 0, 'Butler', 'Rae Christine', 'Mrs.', '1509-6140 Young Street', 'Halifax', 'NS', 'B3K 0G3', '902-455-9415', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (145, 147, 151, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 148: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (148, 'Couple', '2029-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (153, 148, 1, 'Carter', 'Leo Thomas', NULL, '22 Chinook Court', 'Dartmouth', 'NS', 'B3A 4Y4', '902 425 5006', NULL, 'leo.carter@bellmedia.ca', '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (154, 148, 0, 'Carter', 'Anette', NULL, '22 Chinook Court', 'Dartmouth', 'NS', 'B3A 4Y4', '902 425 5006', NULL, 'annettecarter@eastlink.ca', '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (146, 148, 153, 9000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 149: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (149, 'Couple', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (155, 149, 1, 'Collins', 'Michael', NULL, '185 Fergusons Cove Rd.', 'Halifax', 'NS', 'B3V 1L7', '902 399 4320', NULL, '59collins56@gmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (156, 149, 0, 'Collins', 'Rebecca', NULL, '186 Fergusons Cove Rd.', 'Halifax', 'NS', 'B3V 1L8', '902 399 4320', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (147, 149, 155, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 150: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (150, 'Couple', '2028-01-01', 1, '2006-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (157, 150, 1, 'Connolly', 'Jim', 'Mr.', '61 Ridge Park Lane', 'Halifax', 'NS', 'B3N 3J2', '902-445-2855', NULL, 'jimconnolly@eastlink.ca', '2006-01-01', 'Pres. ''2010');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (158, 150, 0, 'Enns  (spouse to Jim)', 'Esther', 'Ms.', '61 Ridge Park Lane', 'Halifax', 'NS', 'B3N 3J2', '902-445-2855', NULL, 'esther.enns@smu.ca', '2006-01-01', 'spouse to Jim Connolly');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (148, 150, 157, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 151: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (151, 'Couple', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (159, 151, 1, 'Cooper (see O''Donnell)', 'Heather Anne', 'Ms.', '22 Ford St.', 'Halifax', 'NS', 'B3M 2M8', '902 406 6240', '902 225 7400', 'h.cooperca@gmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (160, 151, 0, 'O''Donnell', 'James Patrick', 'Mr.', '21 Ford St.', 'Halifax', 'NS', 'B3M 2M8', '902 406 6240', NULL, 'h.cooperca@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (149, 151, 159, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 152: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (152, 'Couple', '2026-01-01', 1, '1995-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (161, 152, 1, 'Cosgrove', 'Kevin', NULL, '11 Bluejay St.', 'Halifax', 'NS', 'B3M 1T9', '902-443-2421', NULL, 'kevincosgrove@eastlink.ca', '1995-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (150, 152, 161, 9000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 153: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (153, 'Couple', '2027-01-01', 1, '1984-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (162, 153, 1, 'Creelman', 'Cornelius', 'Mr.', '168 Mineville Rd.,', 'Lake Echo', 'NS', 'B3E 1N3', '902-829-3776', NULL, 'creelmanmary@gmail.com', '1984-01-01', 'Refund 5$ required. Cheque made out for 35$');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (163, 153, 0, 'Creelman', 'Mary Louise', 'Mrs', '168 Mineville Rd.,', 'Lake Echo', 'NS', 'B3E 1N3', '902-829-3776', NULL, NULL, '1986-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (151, 153, 162, 3500, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 154: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (154, 'Couple', '2027-01-01', 1, '1983-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (164, 154, 1, 'Cregan', 'Richard', 'Mr.', '1657 Vernon Street', 'Halifax', 'NS', 'B3H 3M9', '902-429-2469', NULL, 'richard.cregan@bellaliant.net', '1983-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (165, 154, 0, 'Cregan', 'Marilyn', 'Mrs.', '1658 Vernon Street', 'Halifax', 'NS', 'B3H 3M10', '902 429 2469', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (152, 154, 164, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 155: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (155, 'Couple', '2026-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (166, 155, 1, 'Darnbrough', 'Bill', 'Mr.', '10 Narrowleaf Grove', 'Halifax', 'NS', 'B2W 6P5', '902 2370530', NULL, 'bill_darnbrough@hotmail.com', '2025-01-01', 'friend of Sharon Flanagan');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (167, 155, 0, 'Darnbrough', 'Terry', 'Ms.', '10 Narrowleaf Grove', 'Halifax', 'NS', 'B2W 6P6', '902 717 5407', NULL, '5doubleu.tr@gmail.com', '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (153, 155, 166, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 156: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (156, 'Couple', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (168, 156, 1, 'Dineen', 'Denis', NULL, '355 Toni Avenue', 'Boutliers Point', 'NS', 'B3Z 0J2', '902-826-7093', '902-826-1436', 'denisdineen@hotmail.ca', '2015-01-01', 'they own Delish');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (169, 156, 0, 'Dineen', 'Linda', NULL, '355 Toni Avenue', 'Boutliers Point', 'NS', 'B3Z 0J2', '902-826-7093', NULL, NULL, '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (154, 156, 168, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 157: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (157, 'Couple', '2026-01-01', 1, '2009-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (170, 157, 1, 'Doherty', 'Brian', NULL, 'P.O. Box 31234', 'Hailfax', 'NS', 'B3K 5Y1', '902-492-0057', '902-471-4889', 'brian@evansanddoherty.com', '2009-01-01', 'Pres. ''2012');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (171, 157, 0, 'Doherty', 'Cheryl', NULL, 'P.O. Box 31234', 'Halifax', 'NS', 'B3K 5Y1', '902-492-0057', NULL, NULL, '2009-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (155, 157, 170, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 158: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (158, 'Couple', '2026-01-01', 1, '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (172, 158, 1, 'Donahoe', 'Chris', NULL, 'Ste. 506, 15 King''s Wharf Place', 'Dartmouth', 'NS', 'B2Y 0C2', '902-405-6236', NULL, 'donahoe@eastlink.ca', '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (173, 158, 0, 'Donahoe', 'Patricia', NULL, 'Ste. 506, 15 King''s Wharf Place', 'Dartmouth', 'NS', 'B2Y 0C2', '902-405-6236', NULL, NULL, '2011-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (156, 158, 172, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 159: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (159, 'Couple', '2026-01-01', 1, '1995-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (174, 159, 1, 'Donahoe', 'Sheila', 'Ms.', '456 Francklyn Street', 'Halifax', 'NS', 'B3H 1A9', '902-423-4950', '902 220 1481', 'sdonahoe46@gmail.com', '1995-01-01', 'Pres. ''02');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (157, 159, 174, 6000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 160: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (160, 'Couple', '2028-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (175, 160, 1, 'Donaldson', 'Frederick G.', NULL, '35 Pine Hill Road', 'Dartmouth', NULL, 'B3A 2G2', '902 240 6946', NULL, 'fgdonaldson35@gmail.com', '2020-01-01', 'coupled with Delia Murphy');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (176, 160, 0, 'Murphy', 'Delia', NULL, '35 Pine Hill Road', 'Dartmouth', NULL, 'B3A 2G2', '902 240 6946', NULL, NULL, '2020-01-01', 'coupled wit fred donaldson');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (158, 160, 175, 9000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 161: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (161, 'Couple', '2026-01-01', 1, '1986-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (177, 161, 1, 'Downie, K.C.', 'Brian W.', 'Mr.', '86 Castlepark Grove', 'Halifax', 'NS', 'B3M 4X9', '902-444-6577', NULL, 'bdownie@hfx.eastlink.ca', '1986-01-01', 'Pres. ''2011');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (178, 161, 0, 'Downie', 'Andrea', NULL, '86 Castlepark Grove', 'Halifax', 'NS', 'B3M 4X9', '902-444-6577', NULL, NULL, '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (159, 161, 177, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 162: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (162, 'Couple', '2027-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (179, 162, 1, 'Duffy', 'Daphne', NULL, '719-5 Horizon Court', 'Dartmouth', NULL, 'B3A 0L4', '902.435.6711', NULL, 'daphneduffy1@gmail.com', '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (180, 162, 0, 'Duffy', 'Roy', NULL, '719-5 Horizon Court', 'Dartmouth', NULL, 'B3A 0L4', '902.435.6711', NULL, 'roy_duffy@ns.sympatico.ca', '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (160, 162, 179, 6000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 163: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (163, 'Couple', '2027-01-01', 1, '1980-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (181, 163, 1, 'Earley', 'Mel', 'Mr.', '212-3330 Barnstead Lane', 'Halifax', 'NS', 'B3L 0B1', '902-444-9540', '782-234-6016', 'melearley550@gmail.com', '1980-01-01', 'Pres. ''88');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (182, 163, 0, 'Earley', 'Elizabeth', 'Mrs.', '212-3330 Barnstead Lane', 'Halifax', 'NS', 'B3L 0B1', '782 234 1759', NULL, 'earleyliz@icloud.com', '2022-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (161, 163, 181, 3000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 164: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (164, 'Couple', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (183, 164, 1, 'Erskine', 'Tara', NULL, '6496 Jubilee Road', 'Halifax', 'NS', 'B3H 2H4', '902.334.0436', '902 449 6948', 'terskine@mathewsdinsdale.com', '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (162, 164, 183, 9000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 165: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (165, 'Couple', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (184, 165, 1, 'Evans', 'Kevin', NULL, '11 Burin St', 'St.Johns', 'NL', 'A1E 3S1', '709 330 3039', NULL, 'Kevin@kevinevans.ca', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (185, 165, 0, '(Evans) Trainor', 'Joanie', NULL, '11Burin St', 'St.Johns', 'NL', 'A1E 3S1', NULL, NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (163, 165, 184, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 166: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (166, 'Couple', '2027-01-01', 1, '2002-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (186, 166, 1, 'Feehan', 'Ellen Donahoe', 'Mrs.', '74 Cedar Crescent', 'Dartmouth', 'NS', 'B2V 1Y6', '902-462-3083', NULL, NULL, '2002-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (187, 166, 0, 'Feehan', 'John A.', 'Mr.', '74 Cedar Crescent', 'Dartmouth', 'NS', 'B2V 1Y6', '902-462-3083', NULL, 'feehanfamily@hotmail.com', '2006-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (164, 166, 186, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 167: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (167, 'Couple', '2026-01-01', 1, '2008-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (188, 167, 1, 'Ferguson', 'Helen', 'Mrs.', '135 Oceanfront Drive', 'Prospect', 'NS', 'B3T 2J8', '902-850-2468', NULL, 'haferguson@bellaliant.net', '2008-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (189, 167, 0, 'Ferguson', 'Lorne', NULL, '135 Oceanfront Drive', 'Prospect', 'NS', 'B3T 2J8', '902-859-2468', NULL, NULL, '2008-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (165, 167, 188, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 168: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (168, 'Couple', '2027-01-01', 1, '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (190, 168, 1, 'Fitzpatrick', 'Frank', 'Mr.', 'Unit 1101 - 1540 Summer St.', 'Halifax', 'NS', 'B3H 4R9', '902-423-7568', NULL, 'frank.g.fitz@gmail.com', '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (191, 168, 0, 'Fitzpatrick', 'Mary', 'Mrs.', 'Unit 1101 - 1540 Summer St.', 'Halifax', 'NS', 'B3H 4R9', '902-423-7568', NULL, NULL, '2008-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (166, 168, 190, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 169: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (169, 'Couple', '2026-01-01', 1, '1994-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (192, 169, 1, 'Fogarty', 'Gerry', 'Mr.', '501 - 114 Fairfax Dr.', 'Halifax', 'NS', 'B3S 1J5', '902-443-1175', NULL, NULL, '1994-01-01', 'no email age 89 cbc TV & MLA');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (193, 169, 0, 'Fogarty', 'Stella', 'Mrs.', '502 - 114 Fairfax Dr.', 'Halifax', 'NS', 'B3S 1J5', '902-443-1175', NULL, NULL, '2010-01-01', 'seniors care  stella not well');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (167, 169, 192, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 170: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (170, 'Couple', '2027-01-01', 1, '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (194, 170, 1, 'Gillivan', 'Joe', NULL, '475 Purcell''s Cove Road', 'Halifax', 'NS', 'B3P 2P1', NULL, NULL, 'jgillivan@serviamcoaching.com', '2012-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (195, 170, 0, 'Gillivan', 'Jennifer', NULL, '475 Purcell''s Cove Road', 'Halifax', 'NS', 'B3P 2P1', '902-477-3736', NULL, 'jennifergillivan@hotmail.com', '2012-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (168, 170, 194, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 171: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (171, 'Couple', '2025-01-01', 1, '1983-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (196, 171, 1, 'Guilfoyle', 'John', 'Mr.', '6339 Almon Street', 'Halifax', 'NS', 'B3L 1V4', '902-453-1684', NULL, 'jackandritag@gmail.com', '1983-01-01', 'Jack sick - hosp May 2024');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (197, 171, 0, 'Guilfoyle', 'Rita', 'Mrs.', '6339 Almon Street', 'Halifax', 'NS', 'B3L 1V4', '902-453-1684', NULL, NULL, '2008-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (169, 171, 196, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 172: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (172, 'Couple', '2027-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (198, 172, 1, 'Harkin', 'Rose', NULL, '121 Nictaux Drive', 'Lower Sackville', 'NS', 'B4C 2C6', '902-865-4250', NULL, NULL, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (199, 172, 0, 'Harkin', 'Bosco', NULL, '121 Nictaux Drive', 'Lower Sackville', 'NS', 'B4C 2C6', '902-865-4250', NULL, 'jbharkin@chebucto.ca', '2016-01-01', 'Unsubbed fr newsletter email list');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (170, 172, 198, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 173: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (173, 'Couple', '2026-01-01', 1, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (200, 173, 1, 'Holland', 'Bruce', NULL, '1119 Tower Road  -- #209', 'Haliax', 'NS', 'B3H 4H5', '902-452-7472', NULL, 'bertpublishing@gmail.com', '2022-01-01', 'bruce@discoverspryfield.ca');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (201, 173, 0, 'Baculi-Holland', 'Fe', NULL, '1119 Tower Road -- # 209', 'Haliax', 'NS', 'B3H 4H5', '902-452-7472', NULL, NULL, '2022-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (171, 173, 200, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 174: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (174, 'Couple', '2027-01-01', 1, '2004-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (202, 174, 1, 'Leahey', 'Dennice', 'Mrs.', '41 Sunrise Ridge, P.O. Box 125', 'Pugwash', 'NS', 'B0K 1L0', '902-243-3467', NULL, 'denniceleahey@icloud.com', '2004-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (203, 174, 1, 'Leahey', 'Stephen', 'Mr.', '41 Sunrise Ridge, P.O. Box 125', 'Pugwash', 'NS', 'B0K 1L0', '902-243-3467', NULL, 'stephenleahey@icloud.com', '2004-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (172, 174, 203, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 175: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (175, 'Couple', '2027-01-01', 1, '1981-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (204, 175, 1, 'Mathers', 'Harry', 'Mr.', '706 - 1511 Queen St.', 'Halifax', 'NS', 'B3J 0G4', '902 456 9114', NULL, 'hmathers@ihmathers.com', '1981-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (205, 175, 0, 'Mathers', 'M''Ellen', NULL, '707 - 1511 Queen St.', 'Halifax', 'NS', 'B3J 0G5', '903 456 9114', NULL, 'himathers@ihmathers.com', '1981-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (173, 175, 204, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 176: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (176, 'Couple', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (206, 176, 1, 'Mitchell', 'Ryan', 'Mr.', '707 Pleasant St.', 'Dartmouth', 'NS', 'B2W 1S8', '514 222 5220', NULL, 'makeachange902@gmail.com', '2023-01-01', 'Bus. Analyst');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (207, 176, 0, 'Sundin', 'Cassandra', 'Ms.', '707 Pleasant St.', 'Dartmouth', 'NS', 'B2W 1S8', '902-220-0661', NULL, 'cassie.sundin@hotmail.com', '2025-01-01', 'Ryan''s wife');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (174, 176, 206, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 177: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (177, 'Couple', '2025-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (208, 177, 1, 'Morley', 'Neil', NULL, '1100 Highway 1', 'Mount Uniacke', 'NS', 'B0N 1Z0', '902 414 8441', NULL, 'neilmorley@outlook.com', '2017-01-01', 'NOT coupled with Karen O''Sullivan');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (175, 177, 208, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 178: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (178, 'Couple', '2027-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (209, 178, 1, 'Murphy', 'Brendan', 'Prof.', '1255 West Side Lochaber Rd,', 'Antigonish Co.', 'NS', 'B2G 2L3.', '902-863-9331', '902-867-2481', 'bmurphy@stfx.ca', '2015-01-01', 'text');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (210, 178, 0, 'Murphy', 'Cindy', 'Mrs.', '1256 West Side Lochaber Rd,', 'Antigonish Co.', 'NS', 'B2G 2L3.', NULL, NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (176, 178, 209, 12000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 179: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (179, 'Couple', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (211, 179, 1, 'Murphy', 'Lorna', NULL, '146 Brook Street', 'Halifax', 'NS', 'B3N 2A9', '902-479-1463', '902.476.5552', 'lornamurphy@eastlink.ca', '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (212, 179, 0, 'Murphy', 'Shawn G', NULL, '146 Brook Street', 'Halifax', 'NS', 'B3N 2A9', '902-479-1463', NULL, 'shawnmurphy@eastlink.ca', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (177, 179, 211, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 180: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (180, 'Couple', '2026-01-01', 1, '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (213, 180, 1, 'Murphy', 'Terry', NULL, '111-1044 Tower Road', 'Halifax', 'NS', 'B3H 4R1', '902.454.8141', '902 410 7282', 'tmurphyhfx@gmail.com', '2016-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (214, 180, 1, 'Murphy', 'Sandra', NULL, '111-1044 Tower Road', 'Halifax', 'NS', 'B3H 4R2', '902.454.8141', '902 410 7282', NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (178, 180, 214, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 181: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (181, 'Couple', '2026-01-01', 1, '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (215, 181, 1, 'Nee', 'Marianne', 'Mrs.', '1051 Bellevue Ave.', 'Halifax, N.S. ''', NULL, 'B3H 3M1', '902-422-5458', NULL, NULL, '2003-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (216, 181, 0, 'Nee', 'Michael', 'Mr.', '1051 Bellevue Ave.', 'Halifax', 'NS', 'B3H 3M1', '902-422-5458', NULL, 'mgnee01@gmail.com', '2003-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (179, 181, 215, 6000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 182: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (182, 'Couple', '2025-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (217, 182, 1, 'Nickerson', 'Terry', NULL, '5481 Clyde St', 'Halifax', 'NS', 'B3J 1H7', '902 478 8070', '902-424-6198', 'Terry.Nickerson@novascotia.ca', '2014-01-01', 'will give $$ to Brian D');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (218, 182, 0, 'Nickerson', 'Kate', NULL, '5481 Clyde St', 'Halifax', 'NS', 'B3J 1H7', '902 478 8070', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (180, 182, 217, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 183: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (183, 'Couple', '2025-01-01', 1, '1968-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (219, 183, 1, 'O''Neil LM', 'J. Patrick', 'Mr.', '8 Anchor Dr', 'Halifax', 'NS', 'B3N 0C2', '902-466-3221', NULL, 'poneil@eastlink.ca', '1968-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (220, 183, 0, 'O''Neil', 'Ann M.', 'Mrs.', '8 Anchor Dr.', 'Halifax', 'NS', 'B3N 0C2', '902-466-3221', NULL, 'aoneil@eastlink.ca', '2008-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (181, 183, 219, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 184: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (184, 'Couple', '2027-01-01', 1, '2004-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (221, 184, 1, 'Phillips', 'Sandy', NULL, '#401 - 2717 Gladstone St.', 'Halifax', 'NS', 'B3K 0A4', '902-422-2244', NULL, 'sandy.phillips.m@gmail.com', '2005-01-01', 'Pres. ''2013');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (222, 184, 1, 'Phillips', 'Sean', NULL, '#401 - 2717 Gladstone St.', 'Halifax', 'NS', 'B3K 0A4', '902-422-2244', NULL, 'seanphillipshalifax@gmail.com', '2004-01-01', 'Pres. ''2008');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (182, 184, 222, 9000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 185: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (185, 'Couple', '2027-01-01', 1, '2002-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (223, 185, 1, 'Porter', 'Eileen', NULL, '3353 Ashton Lane', 'Halifax', 'NS', 'B3L 4T5', '902-454-0493', NULL, 'emporter@bellaliant.net', '2002-01-01', '*+ pmt for 2023');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (224, 185, 0, 'Porter', 'John', NULL, '3353 Ashton Lane', 'Halifax', 'NS', 'B3L 4T5', '902-454-0493', NULL, 'sciad3@gmail.com', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (183, 185, 223, 12000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 186: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (186, 'Couple', '2028-01-01', 1, '1996-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (225, 186, 1, 'Reardon', 'Donald', NULL, '1765 Beech St.', 'Halifax', 'NS', 'B3H 4B7', '902-423-0003', NULL, 'dreardon@hrsb.ns.ca', '1996-01-01', 'Pres. '' 2014 married to Brian O''Brien''s Dtr.');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (226, 186, 0, 'Reardon', 'Eileen', NULL, '1765 Beech St.', 'Halifax', 'NS', 'B3H 4B7', '902-423-0003', NULL, 'eileen@fireinside.ca', '2006-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (184, 186, 225, 9000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 187: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (187, 'Couple', '2026-01-01', 1, '2006-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (227, 187, 1, 'Reti', 'Ern', 'Mr.', '11 Charles Street', 'Dartmouth', 'NS', 'B3A 3W5', '902-461-0422', NULL, 'ernoreti@eastlink.ca', '2006-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (228, 187, 0, 'Reti', 'Joan', NULL, '11 Charles Street', 'Dartmouth', 'NS', 'B3A 3W5', '902-461-0422', NULL, NULL, '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (185, 187, 227, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 188: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (188, 'Couple', '2025-01-01', 1, '2018-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (229, 188, 1, 'Robinson', 'Brian S', NULL, '1A - 67 Rose Street', 'Dartmouth', NULL, 'B3A 2T8', '902.404.8489', NULL, 'brian.robinson.hfx@gmail.com', '2018-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (186, 188, 229, 3000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 189: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (189, 'Couple', '2026-01-01', 1, '1994-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (230, 189, 1, 'Scriven', 'J.Peter', 'Mr.', '15 Glenmore Ave.', 'Halifax', 'NS', 'B3N 1W3', '902-477-0241', NULL, 'thescrivenator@bellaliant.net', '1994-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (231, 189, 0, 'Scriven', 'Wendy', 'Mrs.', '15 Glenmore Ave.', 'Halifax', 'NS', 'B3N 1W3', '902-477-0241', NULL, 'thescrivenator@bellaliant.net', '2000-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (187, 189, 230, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 190: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (190, 'Couple', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (232, 190, 1, 'Stokes', 'Deb', NULL, '36 Wamphray Crescent', 'Dartmouth', 'NS', 'B2W 5B4', '902-434-9633', NULL, 'stokes.dj36@gmail.com', '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (233, 190, 0, 'Stokes', 'Jim', NULL, '36 Wamphray Crescent', 'Dartmouth', 'NS', 'B2W 5B4', '902-434-9533', NULL, 'stokes.dj36@gmail.com', '2015-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (188, 190, 232, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 191: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (191, 'Couple', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (234, 191, 1, 'Strapps', 'Nora', NULL, '479 Powers Rd.', 'Whites Lake HRM', NULL, 'B3T1W6', '902 852 4749', NULL, 'nstrapps@protonmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (235, 191, 0, 'Strapps', 'Walter', NULL, '480 Powers Rd.', 'Whites Lake HRM', NULL, 'B3T1W7', '903 852 4749', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (189, 191, 234, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 192: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (192, 'Couple', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (236, 192, 1, 'Sullivan', 'Louise', NULL, '58 Hawkins Drive', 'Hubley', 'NS', 'B3Z 1B6', '902-444-5381', NULL, 'traci_sullivan@hotmail.com', '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (237, 192, 0, 'Sullivan', 'Traci', NULL, '58 Hawkins Drive', 'Hubley', 'NS', 'B3Z 1B6', '902-444-5381', NULL, NULL, '2017-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (190, 192, 236, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 193: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (193, 'Couple', '2026-01-01', 1, '2014-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (238, 193, 1, 'Underhill', 'Theresa Marie', NULL, '1640 Cambridge Street', 'Halifax', 'NS', 'B3H 4A7', '902-454-0836', NULL, 'reeunderhill@gmail.com', '2014-01-01', 'father Dr. John Pres in 1990, President 2017-18');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (239, 193, 0, 'Underhill', 'Rick', NULL, '1640 Cambridge Street', 'Halifax', 'NS', 'B3H 4A7', '902-454-0836', NULL, 'Rickunderhill2@gmail.com', '2014-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (191, 193, 238, 3000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 194: Couple
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (194, 'Couple', '2027-01-01', 1, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (240, 194, 1, 'Vaughan', 'Eileen', NULL, '39 Sea Spray Dr.', 'Eastern Passage', 'NS', 'B3G 1S5', '780-965-3429', NULL, 'emvaughan@hotmail.com', '2025-01-01', 'sister of Sheilia Fougere');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (241, 194, 0, 'Robinson', 'Rick', 'Mr', '39 Sea Spray Dr.', 'Eastern Passage', 'NS', 'B3G 1S5', '780-222-0980', NULL, 'flyerrick@hotmail.com', '2026-01-01', 'Partner of Eileen Vaughen');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (192, 194, 240, 3000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 195: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (195, 'Family', '2026-01-01', 1, '2025-01-01', 'No address on file');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (242, 195, 1, 'Malone', 'Jenny', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (243, 195, 0, 'Malone', 'Matthew', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (244, 195, 0, 'Malone', 'Charlotte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (193, 195, 242, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 196: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (196, 'Family', '2025-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (245, 196, 1, 'Battis', 'Todd', NULL, '19 Canfield Court', 'Bedford', 'NS', 'B4A 3S4', '902 476 4123', NULL, 'todd.battis@bellmedia.ca', '2015-01-01', 'Atlantic Bureau Chief: CTV National News');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (246, 196, 0, 'Battis', 'Ben', NULL, '19 Canfield Court', 'Bedford', 'NS', 'B4A 3S4', '902 476 4123', NULL, NULL, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (247, 196, 0, 'Battis', 'James', NULL, '19 Canfield Court', 'Bedford', 'NS', 'B4A 3S4', '902 476 4123', NULL, NULL, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (248, 196, 0, 'Bonnycastle', 'Kate', NULL, '19 Canfield Court', 'Bedford', 'NS', 'B4A 3S4', '902 476 4123', NULL, NULL, '2021-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (194, 196, 245, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 197: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (197, 'Family', '2026-01-01', 1, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (249, 197, 1, 'Bowes', 'Kieran', NULL, '363 Prince Albert Road', 'Halifax', NULL, NULL, NULL, NULL, 'kabowes@outlook.com', '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (250, 197, 0, 'Bowes', 'Aiofe', NULL, '363 Prince Albert Road', 'Halifax', NULL, NULL, NULL, NULL, NULL, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (251, 197, 0, 'Bowes', 'Debbie', NULL, '363 Prince Albert Road', 'Halifax', NULL, NULL, NULL, NULL, NULL, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (252, 197, 0, 'Bowes', 'Niamh', NULL, '363 Prince Albert Road', 'Halifax', NULL, NULL, NULL, NULL, NULL, '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (195, 197, 249, 12000, 'etransfer', '2023-01-01', 2023, NULL);

-- Membership 198: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (198, 'Family', '2026-01-01', 1, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (253, 198, 1, 'Brownlow', 'Matthew', NULL, '102 Sandpoint Road, Nine Mile River', 'East Hants', 'NS', 'B2S ST1', '902 883 1360', NULL, 'ejcbrownlow@gmail.com', '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (254, 198, 0, 'Brownlow', 'Erin', NULL, '102 Sandpoint Road, Nine Mile River', 'East Hants', 'NS', 'B2S ST1', '902 883 1360', NULL, NULL, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (255, 198, 0, 'Brownlow', 'Kyan', NULL, '102 Sandpoint Road, Nine Mile River', 'East Hants', 'NS', 'B2S ST1', '902 883 1360', NULL, NULL, '2021-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (256, 198, 0, 'Brownlow', 'Ronan', NULL, '102 Sandpoint Road, Nine Mile River', 'East Hants', 'NS', 'B2S ST1', '902 883 1360', NULL, NULL, '2021-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (196, 198, 253, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 199: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (199, 'Family', '2027-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (257, 199, 1, 'Cullinan', 'Patrick', 'Mr.', '28 Walton Dr.', 'Halifax', 'NS', 'B3N 1X7', '902 404 6360', NULL, 'drpatcu@gmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (258, 199, 0, 'Cullinan', 'Heidi', 'Mrs.', '28 Walton Dr.', 'Halifax', 'NS', 'B3N 1X7', '902 818 2978', NULL, 'fsjheidi@gmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (259, 199, 0, 'Cullinan', 'Bridget E.', 'Ms.', '38 Walton Dr.', 'Halifax', 'NS', 'B3N 1X7', '902 404 6360', '902 292 6150', 'bridgetcullinan103@gmail.com', '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (197, 199, 257, 8000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 200: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (200, 'Family', '2027-01-01', 1, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (260, 200, 1, 'Deane', 'Dr. David W. C.', NULL, '12 Thistle Street', 'Dartmouth', 'NS', 'B3A 2V5', '902.718 6261', NULL, 'davidwcdeane@gmail.com', '2019-01-01', 'David.Deane@astheology.ns.ca');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (261, 200, 0, 'Deane', 'Àine', NULL, '12 Thistle Street', 'Dartmouth', 'NS', 'B3A 2V6', '902.718.6261', NULL, NULL, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (262, 200, 0, 'Deane', 'Chora', NULL, '12 Thistle Street', 'Dartmouth', 'NS', 'B3A 2V6', '902.718.6261', NULL, NULL, '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (263, 200, 0, 'Deane', 'Jennifer Derwey', NULL, '12 Thistle Street', 'Dartmouth', 'NS', 'B3A 2V6', '902.718.6261', NULL, 'mailpair@gmail.com', '2019-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (264, 200, 0, 'Deane', 'Sophia', NULL, '12 Thistle Street', 'Dartmouth', 'NS', 'B3A 2V6', '902.718.6261', NULL, NULL, '2019-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (198, 200, 260, 4000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 201: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (201, 'Family', '2025-01-01', 1, '2020-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (265, 201, 1, 'Fagan', 'Ronald', NULL, '45 Lexington Avenue', 'Dartmouth', NULL, 'B2X 3S2', '902 466 4154', NULL, 'yr.gtnit@gmail.com', '2020-01-01', 'seperate from Darlene MacDonald');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (266, 201, 1, 'MacDonald', 'Darlene', NULL, '45 Lexington Avenue', 'Dartmouth', NULL, 'B2X 3S2', '902-210-9606', NULL, 'DMacD391017@gmail.com', '2020-01-01', 'await new address');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (267, 201, 0, 'MacDonald Fagan', 'Ronan (son)', NULL, '45 Lexington Avenue', 'Dartmouth', NULL, 'B2X 3S2', '902-210-0128', NULL, 'ronaldfagan05@gmail.com', '2020-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (199, 201, 266, 12000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 202: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (202, 'Family', '2025-01-01', 1, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (268, 202, 1, 'Fitzgerald', 'Tracey Smith', NULL, '8 Cascade Drive', 'Halifax', 'NS', 'B3M 1Z3', '902 405 9639', NULL, 'traceys@hfx.eastlink.ca', '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (269, 202, 0, 'Fitzgerald', 'Lauren', NULL, '8 Cascade Drive', 'Halifax', 'NS', 'B3M 1Z3', '902 405 9639', NULL, NULL, '2022-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (270, 202, 0, 'Fitzgerald', 'Terry', NULL, '8 Cascade Drive', 'Halifax', 'NS', 'B3M 1Z3', '902 405 9639', NULL, 'refinements@eastlink.ca', '2022-01-01', 'contractor reno');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (200, 202, 268, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 203: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (203, 'Family', '2026-01-01', 1, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (271, 203, 1, 'Long', 'Scott', NULL, '17 Slayter St.', 'Dartmouth', 'NS', 'B3A 1Z8', '902 476 7286', NULL, 'scottflong@gmail.com', '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (272, 203, 0, 'Long', 'Teigan', NULL, '17 Slayter St.', 'Dartmouth', 'NS', 'B3A 1Z8', '902 476 7286', NULL, NULL, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (273, 203, 0, 'Long', 'Carrie MacKenzie', NULL, '17 Slayter St.', 'Dartmouth', 'NS', 'B3A 1Z8', '902 476 7286', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (201, 203, 271, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 204: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (204, 'Family', '2026-01-01', 1, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (274, 204, 1, 'Martin', 'Liz', NULL, '2955 Parkdale Avenue', 'Halifax', 'NS', 'B3L 3Z2', '902 219 0316', NULL, 'lizm@domus.ns.ca', '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (275, 204, 0, 'Martin', 'Aislin', NULL, '2955 Parkdale Avenue', 'Halifax', 'NS', 'B3L 3Z2', '902 719 4896', NULL, 'aislinmartin6@gmail.com', '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (276, 204, 0, 'Martin', 'Dave', NULL, '2955 Parkdale Avenue', 'Halifax', 'NS', 'B3L 3Z2', '902 219 0316', NULL, 'dmartin902@gmail.com', '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (202, 204, 274, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 205: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (205, 'Family', '2026-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (277, 205, 1, 'McCarron', 'Pearse', 'Mr.', '2073 Elm Street', 'Halifax', 'NS', 'B3L 2Y2', '902-403-3049', NULL, 'pearse.mccarron@nrc.ca', '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (278, 205, 0, 'McCarron', 'Kailee', 'Ms.', '2074 Elm Street', 'Halifax', 'NS', 'B3L 2Y2', '902-403-3049', NULL, NULL, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (279, 205, 0, 'McCarron', 'Owen', 'Mstr.', '2075 Elm Street', 'Halifax', 'NS', 'B3L 2Y2', '902-403-3049', NULL, NULL, '2024-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (280, 205, 0, 'McCarron', 'Ruby', 'Miss', '2076 Elm Street', 'Halifax', 'NS', 'B3L 2Y2', '902-403-3049', NULL, NULL, '2024-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (203, 205, 277, 8000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 206: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (206, 'Family', '2029-01-01', 1, '1991-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (281, 206, 1, 'Murphy', 'John', 'Mr.', '5275 Russell Street', 'Halifax', 'NS', 'B3K 1W7', '902-454-5208', NULL, 'john42murphy@gmail.com', '1991-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (282, 206, 0, 'Murphy', 'James', 'Mr', '5275 Russell Street', 'Halifax', 'NS', 'B3K 1W7', NULL, NULL, 'john42murphy@gmail.com', '2026-01-01', 'John Murphy''s Son');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (204, 206, 281, 12000, 'etransfer', '2026-01-01', 2026, NULL);

-- Membership 207: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (207, 'Family', '2026-01-01', 1, '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (283, 207, 1, 'O''Driscoll', 'Ronan', NULL, '12 kyles Court', 'Dartmouth', NULL, 'B2X 3P4', '902 412 7245', NULL, 'ronanodriscoll@gmail.com', '2017-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (284, 207, 0, 'O''Driscoll', 'Brendan', NULL, '12 kyles Court', 'Dartmouth', NULL, 'B2X 3P6', '902 412 7245', NULL, NULL, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (285, 207, 0, 'O''Driscoll', 'Clare', NULL, '12 kyles Court', 'Dartmouth', NULL, 'B2X 3P7', '902 412 7245', NULL, NULL, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (286, 207, 0, 'O''Driscoll', 'Lisa', NULL, '12 kyles Court', 'Dartmouth', NULL, 'B2X 3P5', '902 412 7245', NULL, NULL, '2023-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (287, 207, 0, 'O''Driscoll', 'Martin', NULL, '12 kyles Court', 'Dartmouth', NULL, 'B2X 3P8', '902 412 7245', NULL, NULL, '2023-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (205, 207, 283, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 208: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (208, 'Family', '2026-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (288, 208, 1, 'Ryan-Meister', 'Deanna (Dee)', NULL, '3129 St. Margaret''s Bay Road', 'Timberlea', 'NS', 'B3T 1H5', '902-489-9229', NULL, 'deemeister@eastlink.ca', '2015-01-01', 'Titanic Asscn.');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (289, 208, 0, 'Meister', 'Neil', NULL, '3129 St. Margaret''s Bay Road', 'Timberlea', 'NS', 'B3T 1H5', '902-489-9229', NULL, NULL, '2019-01-01', 'husband');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (290, 208, 0, 'Ryan', 'Robert', NULL, '3130 St. Margaret''s Bay Road', 'Timberlea', 'NS', 'B3T 1H5', '902-489-9229', NULL, NULL, '2025-01-01', 'brother');
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (206, 208, 288, 4000, 'etransfer', '2025-01-01', 2025, NULL);

-- Membership 209: Family
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (209, 'Family', '2025-01-01', 1, '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (291, 209, 1, 'Savage Lft. Govnr.', 'Mike', 'His O', '1451 Barrington St', 'Halifax', 'NS', 'B3J 1Z2', '902 424 7001', NULL, NULL, '2013-01-01', 'LG NS');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (292, 209, 0, 'Savage', 'Conor', NULL, '''''  ''''', '""    ''''', NULL, '''''  ''''', '902 424 7001', NULL, 'Christopher.McCreery@novascotia.ca', '2013-01-01', 'Chris is the LG admin assnt.');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (293, 209, 0, 'Savage', 'Darlene', NULL, '''''  ''''', '""    ''''', NULL, '''''  ''''', '902 424 7001', NULL, 'lgoffice@novascotia.ca', '2013-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (294, 209, 0, 'Savage', 'Emma', NULL, '''''  ''''', '''''  ''''', NULL, '''''  ''''', '902 424 7001', NULL, NULL, '2013-01-01', NULL);
INSERT INTO payments (payment_id, membership_id, paid_by_member_id, amount_cents, method, date_received, dues_year, notes) VALUES (207, 209, 291, 4000, 'etransfer', '2024-01-01', 2024, NULL);

-- Membership 210: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (210, 'Exempt', NULL, 1, '1971-01-01', 'Pres. ''77 Life Member - 50 years');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (295, 210, 1, 'Butler LM', 'Peter', 'Mr.', '9 Samuel Terrace', 'Halifax', 'NS', 'B3N 2Z9', '902-479-1975', NULL, NULL, '1971-01-01', 'Pres. ''77 Life Member - 50 years');

-- Membership 211: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (211, 'Exempt', NULL, 1, '1967-01-01', 'Bro');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (296, 211, 1, 'Connolly LM', 'David', 'Mr.', 'PO.Box 264 10 Woodland Way', 'Eastham', 'Mass USA', 'O2642', '508 255 5072', NULL, 'dconnollyj@gmail.com', '1967-01-01', 'Bro');

-- Membership 212: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (212, 'Exempt', NULL, 1, '1967-01-01', 'Wife passed away in April 2017');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (297, 212, 1, 'Connolly LM', 'Dennis', 'Mr.', 'P.O Box 792', 'Chester.NS', NULL, 'BOJ 1J0', '902-275-3941', NULL, NULL, '1967-01-01', 'Wife passed away in April 2017');

-- Membership 213: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (213, 'Exempt', NULL, 1, '1948-01-01', 'LM long time member');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (298, 213, 1, 'Connolly LM', 'Edward', 'Mr.', '220 Gaspereau Ave.', 'Wolfville', 'NS', 'B4P 2E6', '902-542-7683', NULL, NULL, '1948-01-01', 'LM long time member');

-- Membership 214: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (214, 'Exempt', NULL, 1, '1965-01-01', 'Pres. ''70');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (299, 214, 1, 'Downie, K.C. LM', 'Ronald', 'Mr.', '5925 Emscote Drive', 'Halifax', 'NS', 'B3H 1B3', '902-425-5524', NULL, 'ronalddownie@ns.sympatico.ca', '1965-01-01', 'Pres. ''70');

-- Membership 215: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (215, 'Exempt', '2027-01-01', 1, '2006-01-01', 'Armed forces veteran living in poverty');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (300, 215, 1, 'Hancock C.D.', 'Kelly W.', 'Mr.', 'PO Box 135, 115 King St.', 'Windsor', 'NS', NULL, '902-790-9305', NULL, 'kelw.hancock@gmail.com', '2006-01-01', 'Armed forces veteran living in poverty');

-- Membership 216: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (216, 'Exempt', NULL, 1, '1966-01-01', 'Pres. ''75');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (301, 216, 1, 'Harvey LM', 'Robert', 'Mr.', '272 Hallmark Avenue', 'Lr Sackville', 'NS', 'B4C 3R1', '902-864-4160', NULL, '24greenstreet@gmail.com', '1966-01-01', 'Pres. ''75');

-- Membership 217: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (217, 'Exempt', NULL, 1, '1973-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (302, 217, 1, 'Hayes, K.C. LM', 'Lawrence', 'Mr.', '967 Beaufort Avenue', 'Halifax', 'NS', 'B3H 3X9', '902-422-5837', NULL, 'larhay1@icloud.com', '1973-01-01', NULL);

-- Membership 218: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (218, 'Exempt', '2026-01-01', 1, '2007-01-01', 'Dr. Brian O`Brien`s wife');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (303, 218, 1, 'O''Brien', 'Florence', 'Mrs.', '82 Milsom St.', 'Halifax', 'NS', 'B3N 3M5', '902-429-4845', NULL, NULL, '2007-01-01', 'Dr. Brian O`Brien`s wife');

-- Membership 219: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (219, 'Exempt', '2026-01-01', 1, '2014-01-01', 'No further info');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (304, 219, 1, 'O''Brien (LM wife)', 'Janet', NULL, '60 Mason''s Point Rd.', 'Head St. Margarets Bay', 'NS', 'B3Z 2A8', '902-826-2240', NULL, NULL, '2014-01-01', 'No further info');

-- Membership 220: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (220, 'Exempt', NULL, 1, '1960-01-01', 'LM (Father Michael Dennis O''Brien Pres.1954)');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (305, 220, 1, 'O''Brien LM', 'Michael', 'Mr.', '60 Mason''s Point Rd.', 'Head St. Margarets Bay', 'NS', 'B3Z 2A8', '902-826-2240', NULL, 'michaelobrien1935@icloud.com', '1960-01-01', 'LM (Father Michael Dennis O''Brien Pres.1954)');

-- Membership 221: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (221, 'Exempt', '2025-01-01', 1, '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (306, 221, 1, 'O''Neil', 'Cathy', NULL, '104 Milsom Street', 'Halifax', 'NS', 'B3M 3M5', '902-233-0580', NULL, 'jconeil@mac.com', '2011-01-01', NULL);

-- Membership 222: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (222, 'Exempt', '2025-01-01', 1, '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (307, 222, 1, 'O''Neil', 'Colin', NULL, '104 Milsom Street', 'Halifax', 'NS', 'B3M 3M5', '902-233-0580', NULL, NULL, '2011-01-01', NULL);

-- Membership 223: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (223, 'Exempt', '2025-01-01', 1, '1999-01-01', 'Pres. ''07. In return for his contribution as CIS treasurer, Jamie''s membership fee is waived.');
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (308, 223, 1, 'O''Neil', 'Jamie', 'Mr.', '104 Milsom Street', 'Halifax', 'NS', 'B3M 3M5', '902-492-1418', '902-233-0580', 'joneil@kpmg.ca', '1999-01-01', 'Pres. ''07. In return for his contribution as CIS treasurer, Jamie''s membership fee is waived.');

-- Membership 224: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (224, 'Exempt', '2025-01-01', 1, '2011-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (309, 224, 1, 'O''Neil', 'Matthew', NULL, '104 Milsom Street', 'Halifax', 'NS', 'B3M 3M5', '902-233-0580', NULL, NULL, '2011-01-01', NULL);

-- Membership 225: Exempt
INSERT INTO memberships (membership_id, type, next_due_date, active, created_date, notes) VALUES (225, 'Exempt', '2025-01-01', 1, '2015-01-01', NULL);
INSERT INTO members (member_id, membership_id, is_payer, last_name, first_name, pronouns_title, street_address, city, province, postal_code, phone, phone_secondary, email, date_joined, notes) VALUES (310, 225, 1, 'O''Regan (LM wife)', 'Barbara', NULL, '1935 Cambridge Street', 'Halifax', 'NS', 'B3H 4B1', '902-423-1971', NULL, NULL, '2015-01-01', NULL);

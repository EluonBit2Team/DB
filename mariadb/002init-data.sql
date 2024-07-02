use user_setting_db;
INSERT INTO user (login_id, password, name, phone, email, did, position, role, create_date, max_tps)
    VALUES ('admin', UNHEX(SHA2('admin', 256)), 'eluon', '010', 'gmail', 0, 0, 1, NOW(), 120);

INSERT INTO user (login_id, password, name, phone, email, did, position, role, create_date, max_tps)
    VALUES ('admin2', UNHEX(SHA2('admin2', 256)), 'eluon', '010', 'gmail', 0, 0, 1, NOW(), 120);

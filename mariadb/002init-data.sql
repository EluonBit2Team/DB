use user_setting_db;
INSERT INTO user (login_id, password, name, phone, email, did, position, role, create_date, max_tps)
    VALUES ('admin', UNHEX(SHA2('admin', 256)), 'eluon', '010', 'gmail', 1, 1, 1, NOW(), 120);

INSERT INTO user (login_id, password, name, phone, email, did, position, role, create_date, max_tps)
    VALUES ('admin2', UNHEX(SHA2('admin2', 256)), 'eluon', '010', 'gmail', 1, 1, 1, NOW(), 120);

INSERT INTO user_setting_db.dept (did, dept_name)
    VALUES (1, '인사');
INSERT INTO user_setting_db.dept (did, dept_name)
    VALUES (2, '네트워크');
INSERT INTO user_setting_db.dept (did, dept_name)
    VALUES (3, '경영지원');
INSERT INTO user_setting_db.dept (did, dept_name)
    VALUES (4, '연구개발');

INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(1, '회장');
INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(2, '사장');
INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(3, '차장');
INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(4, '과장');
INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(5, '대리');
INSERT INTO user_setting_db.job_position (pid, position_name)
    VALUES(6, '사원');
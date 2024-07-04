USE log_db;
DROP PROCEDURE IF EXISTS dm_message;

DELIMITER //
CREATE PROCEDURE dm_message(
    IN p_sender_uid INT,
    IN p_sender_login_id VARCHAR(20),
    IN p_recver_uid INT,
    IN p_recver_login_id VARCHAR(20),
    IN p_text TEXT,
    IN p_tps INT,
    OUT result_now DATETIME
	)
BEGIN
	DECLARE msg_count INT;
    -- 과거 1분 동안 쌓여있는 메시지의 개수 확인
    SELECT COUNT(*) INTO msg_count
    FROM dm_log
    WHERE timestamp >= NOW() - INTERVAL 1 MINUTE
    AND sender_uid = p_sender_uid;

    -- 메시지의 개수가 tps 값보다 크거나 같으면 실패
    IF msg_count >= p_tps THEN
        SET result_now = NULL; -- 실패
    ELSE
        -- 조건을 만족하면 메시지 삽입
        INSERT INTO dm_log (sender_uid, sender_login_id, recver_uid, recver_login_id, text, timestamp)
        VALUES (p_sender_uid, p_sender_login_id, p_recver_uid, p_recver_login_id, p_text, NOW());
        SET result_now = NOW(); -- 성공
    END IF;
END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_message;
DELIMITER //
CREATE PROCEDURE insert_message(
    IN p_uid INT,
    IN p_gid INT,
    IN p_text TEXT,
    IN p_tps INT,
    IN p_login_id VARCHAR(20),
    IN p_groupname VARCHAR(20),
    OUT result_now DATETIME
)
BEGIN
    DECLARE msg_count INT;

    -- 과거 1분 동안 쌓여있는 메시지의 개수 확인
    SELECT COUNT(*) INTO msg_count
    FROM message_log
    WHERE timestamp >= NOW() - INTERVAL 1 MINUTE
    AND uid = p_uid;

    -- 메시지의 개수가 tps 값보다 크거나 같으면 실패
    IF msg_count >= p_tps THEN
        SET result_now = NULL; -- 실패
    ELSE
        -- 조건을 만족하면 메시지 삽입
        INSERT INTO message_log (uid, gid, text, timestamp, login_id, groupname)
        VALUES (p_uid, p_gid, p_text, NOW(), p_login_id, p_groupname);
        SET result_now = NOW(); -- 성공
    END IF;
END
//
DELIMITER ;
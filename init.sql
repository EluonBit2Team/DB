CREATE DATABASE IF NOT EXISTS user_setting_db;
CREATE DATABASE IF NOT EXISTS chat_group_db;
CREATE DATABASE IF NOT EXISTS server_statistic_db;
CREATE DATABASE IF NOT EXISTS user_request_db;
CREATE DATABASE IF NOT EXISTS log_db;

-- ############# 유저 정보 DB 세팅 ############# --
USE user_setting_db;
CREATE TABLE IF NOT EXISTS dept
(
  did       INT         NOT NULL AUTO_INCREMENT COMMENT '부서 ID',
  dept_name VARCHAR(10) NULL     COMMENT '부서명',
  PRIMARY KEY (did)
) COMMENT '부서';

CREATE TABLE IF NOT EXISTS user
(
  uid             INT            NOT NULL AUTO_INCREMENT COMMENT '유저PK',
  login_id        VARCHAR(20)    NULL     COMMENT '유저 ID',
  password        VARBINARY(255) NULL     COMMENT '유저 비밀번호',
  name            VARCHAR(20)    NULL     COMMENT '유저 이름',
  phone           VARCHAR(20)    NULL     COMMENT '유저 전화번호',
  email           VARCHAR(50)    NULL     COMMENT '유저 이메일',
  deptno          INT            NULL     COMMENT '부서',
  position        INT            NULL     COMMENT '유저 직급',
  role            INT            NULL     COMMENT '유저 역할',
  last_login_date DATETIME       NULL     COMMENT '최종 접속 시간',
  create_date     DATETIME       NULL     COMMENT '회원 가입 일자',
  max_tps         INT            NULL     COMMENT '최대 메세지 제한',
  PRIMARY KEY (uid)
) COMMENT '유저';

-- ############# 채팅 그룹 DB 세팅 ############# --
USE chat_group_db;
CREATE TABLE IF NOT EXISTS chat_group
(
  gid       INT         NOT NULL AUTO_INCREMENT COMMENT '그룹 PK',
  groupname VARCHAR(10) NULL     COMMENT '그룹네임',
  PRIMARY KEY (gid)
) COMMENT '그룹';

CREATE TABLE IF NOT EXISTS group_member
(
  uid     INT     NOT NULL,
  gid     INT     NOT NULL,
  is_host BOOLEAN NULL    ,
  PRIMARY KEY (uid, gid)
) COMMENT '그룹멤버';

-- ############# 서버 통계 DB 세팅 ############# --
USE server_statistic_db;
CREATE TABLE IF NOT EXISTS statistic
(
  sid              INT      NOT NULL AUTO_INCREMENT COMMENT '통계 PK',
  tps_avg          DOUBLE   NULL     COMMENT 'TPS 평균',
  tps_max          INT      NULL     COMMENT 'TPS 최대',
  mem_avg          DOUBLE   NULL     COMMENT '메모리 평균',
  mem_max          INT      NULL     COMMENT '메모리 최대',
  access_count_avg DOUBLE   NULL     COMMENT '접속자수 평균',
  access_count_max INT      NULL     COMMENT '접속자수 최대',
  log_timestamp    DATETIME NULL     COMMENT '기록시간',
  PRIMARY KEY (sid)
) COMMENT '통계';

-- ############# 유저 요청 DB 세팅 ############# --
USE user_request_db;
CREATE TABLE IF NOT EXISTS group_req
(
  group_req_id INT         NOT NULL AUTO_INCREMENT COMMENT '그룹요청id',
  groupname    VARCHAR(10) NULL     COMMENT '그룹네임',
  uid          INT         NULL     COMMENT '호스트',
  PRIMARY KEY (group_req_id)
) COMMENT '그룹생성 요청';

CREATE TABLE IF NOT EXISTS signin_req
(
  sign_req_id     INT            NOT NULL AUTO_INCREMENT COMMENT '요청ID',
  login_id        VARCHAR(20)    NULL     COMMENT '유저 ID',
  password        VARBINARY(255) NULL     COMMENT '유저 비밀번호',
  name            VARCHAR(20)    NULL     COMMENT '유저 이름',
  phone           VARCHAR(20)    NULL     COMMENT '유저 전화번호',
  email           VARCHAR(50)    NULL     COMMENT '유저 이메일',
  deptno          INT            NULL     COMMENT '부서',
  position        INT            NULL     COMMENT '유저 직급',
  role            INT            NULL     COMMENT '유저 역할',
  last_login_date DATETIME       NULL     COMMENT '최종 접속 시간',
  create_date     DATETIME       NULL     COMMENT '회원 가입 일자',
  max_tps         INT            NULL     COMMENT '최대 메세지 제한',
  PRIMARY KEY (sign_req_id)
) COMMENT '회원가입 요청';

-- ############# 로그 DB 세팅 ############# --
USE log_db;
CREATE TABLE IF NOT EXISTS client_log
(
  client_log_id INT      NOT NULL AUTO_INCREMENT COMMENT '클라이언트 PK',
  uid           INT      NULL     COMMENT '유저 ID',
  client_status BOOL     NULL     COMMENT '클라이언트 상태',
  timestamp     DATETIME NULL     COMMENT '시간',
  PRIMARY KEY (client_log_id)
) COMMENT '클라로그';

CREATE TABLE IF NOT EXISTS server_log
(
  server_log_id INT      NOT NULL AUTO_INCREMENT COMMENT '서버로그 PK',
  server_status BOOL     NULL     COMMENT '서버상태',
  timestamp     DATETIME NULL     COMMENT '시간',
  PRIMARY KEY (server_log_id)
) COMMENT '서버로그';

CREATE TABLE IF NOT EXISTS massage_log
(
  mid       INT      NOT NULL AUTO_INCREMENT,
  uid       INT      NULL    ,
  gid       INT      NULL    ,
  text      TEXT     NULL    ,
  timestamp DATETIME NULL    ,
  PRIMARY KEY (mid)
) COMMENT '메세지로그';
CREATE DATABASE IF NOT EXISTS user_setting_db;
CREATE DATABASE IF NOT EXISTS chat_group_db;
CREATE DATABASE IF NOT EXISTS server_statistic_db;
CREATE DATABASE IF NOT EXISTS log_db;

-- ############# 유저 정보 DB 세팅 ############# --
USE user_setting_db;
CREATE TABLE IF NOT EXISTS `dept` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '부서 ID',
  `dept_name` varchar(10) DEFAULT NULL COMMENT '부서명',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='부서';

CREATE TABLE IF NOT EXISTS `job_position` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '직급 ID',
  `position_name` varchar(10) DEFAULT NULL COMMENT '직급명',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='직급';

CREATE TABLE IF NOT EXISTS `signup_req` (
  `sign_req_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '요청ID',
  `login_id` varchar(20) DEFAULT NULL COMMENT '유저 ID',
  `password` varbinary(256) DEFAULT NULL COMMENT '유저 비밀번호',
  `name` varchar(20) DEFAULT NULL COMMENT '유저 이름',
  `phone` varchar(20) DEFAULT NULL COMMENT '유저 전화번호',
  `email` varchar(50) DEFAULT NULL COMMENT '유저 이메일',
  PRIMARY KEY (`sign_req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='회원가입 요청';

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '유저PK',
  `login_id` varchar(20) DEFAULT NULL COMMENT '유저 ID',
  `password` varbinary(256) DEFAULT NULL COMMENT '유저 비밀번호',
  `name` varchar(20) DEFAULT NULL COMMENT '유저 이름',
  `phone` varchar(20) DEFAULT NULL COMMENT '유저 전화번호',
  `email` varchar(50) DEFAULT NULL COMMENT '유저 이메일',
  `did` int(11) DEFAULT NULL COMMENT '부서',
  `position` int(11) DEFAULT NULL COMMENT '유저 직급',
  `role` int(11) DEFAULT NULL COMMENT '유저 역할',
  `last_login_date` datetime DEFAULT NULL COMMENT '최종 접속 시간',
  `create_date` datetime DEFAULT NULL COMMENT '회원 가입 일자',
  `max_tps` int(11) DEFAULT NULL COMMENT '최대 메세지 제한',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_unique` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='유저';


-- ############# 채팅 그룹 DB 세팅 ############# --
USE chat_group_db;
CREATE TABLE IF NOT EXISTS `chat_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹 PK',
  `groupname` varchar(20) DEFAULT NULL COMMENT '그룹네임',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='그룹';

CREATE TABLE IF NOT EXISTS `group_member` (
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `is_host` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='그룹멤버';

CREATE TABLE IF NOT EXISTS `group_req` (
  `gr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '요청 그룹 id',
  `groupname` varchar(20) DEFAULT NULL COMMENT '그룹명',
  `uid` int(11) NOT NULL COMMENT '요청유저의 id',
  `memo` text DEFAULT NULL COMMENT '요청 메모',
  PRIMARY KEY (`gr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='그룹 요청';

-- ############# 서버 통계 DB 세팅 ############# --
USE server_statistic_db;
CREATE TABLE IF NOT EXISTS `statistic` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '통계 PK',
  `tps_avg` double DEFAULT NULL COMMENT 'TPS 평균',
  `tps_max` int(11) DEFAULT NULL COMMENT 'TPS 최대',
  `mem_avg` double DEFAULT NULL COMMENT '메모리 평균',
  `mem_max` double DEFAULT NULL COMMENT '메모리 최대',
  `login_user_cnt_avg` double DEFAULT NULL COMMENT '접속자수 평균',
  `login_user_cnt_max` int(11) DEFAULT NULL COMMENT '접속자수 최대',
  `log_timestamp` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '기록시간',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1405 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='통계';

-- ############# 로그 DB 세팅 ############# --
USE log_db;
CREATE TABLE IF NOT EXISTS `client_log` (
  `client_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '클라이언트 PK',
  `uid` int(11) DEFAULT NULL COMMENT '유저 ID',
  `login_time` datetime DEFAULT NULL COMMENT '클라이언트 상태',
  `logout_time` datetime DEFAULT NULL COMMENT '시간',
  PRIMARY KEY (`client_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='클라로그';

-- log_db.dm_log definition

CREATE TABLE IF NOT EXISTS `dm_log` (
  `dm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_uid` int(11) DEFAULT NULL,
  `sender_login_id` varchar(20) DEFAULT NULL,
  `recver_uid` int(11) DEFAULT NULL,
  `recver_login_id` varchar(20) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='dm로그';

CREATE TABLE IF NOT EXISTS `server_log` (
  `server_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '서버로그 PK',
  `uptime` datetime DEFAULT NULL COMMENT '시간',
  `downtime` datetime DEFAULT NULL,
  PRIMARY KEY (`server_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='서버로그';

CREATE TABLE IF NOT EXISTS `message_log` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `login_id` varchar(20) DEFAULT NULL COMMENT '메세지 날린 유저의 아이디',
  `groupname` varchar(10) DEFAULT NULL COMMENT '채팅 그룹 이름',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='메세지로그';

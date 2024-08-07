CREATE USER IF NOT EXISTS 'today_chicken'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'%' WITH GRANT OPTION;

CREATE USER IF NOT EXISTS 'today_chicken'@'localhost' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'localhost' WITH GRANT OPTION;

CREATE USER IF NOT EXISTS 'grafana_dash'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'%';
GRANT SELECT ON `log_db`.`server_log` TO 'grafana_dash'@'%';

CREATE USER IF NOT EXISTS 'grafana_dash'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'localhost';
GRANT SELECT ON `log_db`.`server_log` TO 'grafana_dash'@'localhost';

FLUSH PRIVILEGES;
CREATE USER 'today_chicken'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'localhost' WITH GRANT OPTION;

CREATE USER 'grafana_dash'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT SELECT PRIVILEGES ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'%';
GRANT SELECT PRIVILEGES ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'localhost';
FLUSH PRIVILEGES;
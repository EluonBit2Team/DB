-- CREATE USER 'today_chicken'@'%' IDENTIFIED BY '1q2w3e4r';
-- GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'%' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'localhost' WITH GRANT OPTION;

-- CREATE USER 'grafana_dash'@'%' IDENTIFIED BY '1q2w3e4r';
-- GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'%';
-- GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'localhost';

-- FLUSH PRIVILEGES;

-- Create and grant privileges to 'today_chicken'
CREATE USER IF NOT EXISTS 'today_chicken'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'%' WITH GRANT OPTION;

-- CREATE USER IF NOT EXISTS 'today_chicken'@'localhost' IDENTIFIED BY '1q2w3e4r';
-- GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'localhost' WITH GRANT OPTION;

-- Create and grant privileges to 'grafana_dash'
CREATE USER IF NOT EXISTS 'grafana_dash'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'%';

-- CREATE USER IF NOT EXISTS 'grafana_dash'@'localhost' IDENTIFIED BY '1q2w3e4r';
-- GRANT SELECT ON `server_statistic_db`.`statistic` TO 'grafana_dash'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;
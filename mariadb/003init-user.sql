CREATE USER 'today_chicken'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'today_chicken'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
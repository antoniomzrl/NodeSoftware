
CREATE DATABASE IF NOT EXISTS radamdb;

CREATE USER radamu IDENTIFIED BY 'radamp';
GRANT ALL PRIVILEGES ON *.* TO radamu;
GRANT ALL PRIVILEGES ON *.* TO 'radamu'@'localhost';
# Problem ERROR 1045:
SET PASSWORD FOR radamu@localhost=PASSWORD('radamp');

# Show all:
SELECT USER FROM mysql.user;
SELECT USER, HOST FROM mysql.user;
SHOW GRANTS FOR radamu;


CREATE USER 'exporter'@'172.18.0.%' IDENTIFIED BY 'exporter';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'172.18.0.%';
FLUSH PRIVILEGES;

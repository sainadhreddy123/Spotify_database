
mysql> create database spotify;
database created
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| priyasai           |
| rupak              |
| sainadh            |
| spotify            |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

mysql> connect spotify;
Enter password: *****
Connection id:    26
Current database: spotify


mysql> CREATE TABLE bands (
    ->   id INT NOT NULL AUTO_INCREMENT,
    ->   name VARCHAR(255) NOT NULL,
    ->   PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE albums (
    ->   id INT NOT NULL AUTO_INCREMENT,
    ->   name VARCHAR(255) NOT NULL,
    ->   release_year INT,
    ->   band_id INT NOT NULL,
    ->   PRIMARY KEY (id),
    ->   FOREIGN KEY (band_id) REFERENCES bands(id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE songs (
    ->   id INT NOT NULL AUTO_INCREMENT,
    ->   name VARCHAR(255) NOT NULL,
    ->   length FLOAT NOT NULL,
    ->   album_id INT NOT NULL,
    ->   PRIMARY KEY (id),
    ->   FOREIGN KEY (album_id) REFERENCES albums(id)
    -> );
Query OK, 0 rows affected (0.05 sec)


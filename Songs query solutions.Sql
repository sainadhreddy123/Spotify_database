1)_____________________________________bands names__________________________
mysql> SELECT bands.name AS 'Band Name' from bands;
+-----------+
| Band Name |
+-----------+
| SaiNadh   |
| Pavan     |
| SNR       |
| Butterfly |
| Rabbit    |
| The_Lion  |
| King      |
+-----------+
2)__________________________it shows for limit values_______________________-
mysql> SELECT * FROM albums
    -> WHERE release_year IS NOT NULL
    -> ORDER BY release_year
    -> LIMIT 1;
+----+------------------------+--------------+---------+
| id | name                   | release_year | band_id |
+----+------------------------+--------------+---------+
|  5 | ...And Justice for All |         1988 |       2 |
+----+------------------------+--------------+---------+
3)___________________________________/* This assummes all bands have a unique name */_______________________________
mysql> SELECT DISTINCT bands.name AS 'Band Name'
    -> FROM bands
    -> JOIN albums ON bands.id = albums.band_id;
+-----------+
| Band Name |
+-----------+
| SaiNadh   |
| Pavan     |
| SNR       |
| Butterfly |
| Rabbit    |
| The_Lion  |
+-----------+
3)_____________________________**________________________________
 SELECT bands.name AS 'Band Name'
    -> FROM bands
    -> LEFT JOIN albums ON bands.id = albums.band_id
    -> GROUP BY albums.band_id
    -> HAVING COUNT(albums.id) = 0;
+-----------+
| Band Name |
+-----------+
| King      |
+-----------+
4)_____________________________
mysql> SELECT
    ->   albums.name as Name,
    ->   albums.release_year as 'Release Year',
    ->   SUM(songs.length) as 'Duration'
    -> FROM albums
    -> JOIN songs on albums.id = songs.album_id
    -> GROUP BY songs.album_id
    -> ORDER BY Duration DESC
    -> LIMIT 1;
+----------------+--------------+-------------------+
| Name           | Release Year | Duration          |
+----------------+--------------+-------------------+
| Death Magnetic |         2008 | 74.76666593551636 |
+----------------+--------------+-------------------+
5)________________/**update the song**/___________________
mysql> UPDATE songs SET name = 'Zara_Zara' where id =4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from songs where id =4;
+----+-----------+---------+----------+
| id | name      | length  | album_id |
+----+-----------+---------+----------+
|  4 | Zara_Zara | 6.96667 |        1 |
+----+-----------+---------+----------+
6)_______________________/* This is the query used to get the band id of the band just added */________
mysql> INSERT INTO bands (name)
    -> VALUES ('Favorite Band Name');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO albums (name, release_year, band_id)
    -> VALUES ('Favorite Album Name', 2000, 8);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT id FROM bands
    ->   ORDER BY id DESC LIMIT 1;
+----+
| id |
+----+
|  8 |
+----+
7)________________/* This query we are using Average Song Duration*/_________________
mysql> SELECT AVG(length) as 'Average Song Duration'
    -> FROM songs;
+-----------------------+
| Average Song Duration |
+-----------------------+
|     5.352472513259112 |
+-----------------------+
8)______________________________/* This Query we are using one particular band how many songs are realsed*/_________________ 
mysql> SELECT
    ->   bands.name AS 'Band',
    ->   COUNT(songs.id) AS 'Number of Songs'
    -> FROM bands
    -> JOIN albums ON bands.id = albums.band_id
    -> JOIN songs ON albums.id = songs.album_id
    -> GROUP BY albums.band_id;
+-----------+-----------------+
| Band      | Number of Songs |
+-----------+-----------------+
| SaiNadh   |              35 |
| Pavan     |              27 |
| SNR       |              31 |
| Butterfly |              30 |
| Rabbit    |              27 |
| The_Lion  |              32 |
+-----------+-----------------+





































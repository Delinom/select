SELECT track_name, track_duration
FROM tracks
ORDER BY track_duration DESC
LIMIT 1;

SELECT track_name, track_duration 
FROM tracks
WHERE track_duration >= 210
ORDER BY track_duration DESC;

SELECT collection_name, collection_year 
FROM collections   
WHERE collection_year  BETWEEN 2018 AND 2020;

SELECT author_name  
FROM authors  
WHERE author_name NOT LIKE '% %';

SELECT track_name 
FROM tracks
WHERE track_name ~* '\mмой\M' OR track_name ~* '\mmy\M';

SELECT g.genre_name, COUNT(a.author_id) AS author_count
FROM authors a
JOIN authorsgenres ag ON a.author_id = ag.author_id
JOIN genres g ON ag.genre_id = g.genre_id
GROUP BY g.genre_name;

SELECT COUNT(t.track_id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.album_year  BETWEEN 2019 AND 2020;

SELECT a.album_name, ROUND(AVG(t.track_duration), 2) AS avg_duration
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
GROUP BY a.album_id, a.album_name;

SELECT DISTINCT a.author_name
FROM authors a
WHERE a.author_name NOT IN (
	SELECT DISTINCT a.author_name 
	FROM authors
	LEFT JOIN albumsauthors aa ON a.author_id = aa.author_id
	LEFT JOIN albums al ON aa.album_id = al.album_id
	WHERE al.album_year = 2021);


SELECT DISTINCT c.collection_name
FROM collections c
JOIN collectionstracks ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN albumsauthors aa ON a.album_id = aa.album_id
JOIN authors au ON aa.author_id = au.author_id
WHERE au.author_name = 'Король и Шут';

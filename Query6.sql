-- Query 6:
SELECT artists.Name, count(albums.AlbumId)
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId
GROUP BY artists.Name;
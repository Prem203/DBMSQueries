Assignment 3 Submission by Prem Vora

# Music Video Queries

Some fun queries for a music database.

## Step 1. Start the Sqllite3 DB Browser and download the Database:

Downlaod the Sample Relational DB called Chinook from the link: https://www.sqlitetutorial.net/sqlite-sample-database/ 
and unzip it in the root folder of your project.

## Step 2. Run the Queries:

Open the Database in your Sqllite Browser and run the .sql file one by one.

### Query 1: Creates a new Table Music Video, that is a class of type Track (generalization) but adds the attribute Video director. A music video is a track. There cannot be a video without a track, and each track can have either no video or just one.

```
CREATE TABLE "MusicVideo" (
	"track_id"	INTEGER NOT NULL,
	"video_director"	TEXT,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("track_id"),
	FOREIGN KEY("track_id") REFERENCES "tracks"("TrackId"));
```

### Query 2: Writes the queries that insert at least 10 videos, respecting the problem rules.

```
INSERT INTO MusicVideo ( track_id, video_director, name)
VALUES (1, "John", "For Those About To Rock (We Salute You)"),
(2, "Nolan", "Balls to the Wall"),
(3, "Tarrantino", "Fast As a Shark"),
(4, "Walker", "Restless and Wild"),
(5, "Biden", "Princess of the Dawn"),
(6, "Gunn", "Put The Finger On You"),
(7, "Taylor", "Let's Get It Up"),
(8, "Chris", "Inject The Venom"),
(9, "Alexis", "Snowballed"),
(10, "Gates", "Evil Walks");
```

### Query 3: Insert another video for the track "Voodoo", assuming we don't know the TrackId.

```
INSERT INTO MusicVideo (track_id, video_director, name)
SELECT TrackId, "Scorcesse", "Voodoo"
FROM tracks
WHERE name == "Voodoo";
```

### Query 4: Writes a query that lists all the tracks that have a ' in the name (e.g. Jorge Da Capadócia, o Samba De Uma Nota Só (One Note Samba)) (this is á,é,í,ó,ú)

```
SELECT * FROM tracks 
WHERE name LIKE "%ó%"
OR name LIKE "%á%"
OR name LIKE "%é%"
OR name LIKE "%í%"
OR name LIKE "%ú%";
```

### Query 5: An interesting query that uses a JOIN of at least two tables.

```
SELECT *
FROM tracks
FULL OUTER JOIN MusicVideo ON tracks.TrackId = MusicVideo.track_id;
```

### Query 6: An interesting query that uses a GROUP statement and at least two tables.

```
SELECT artists.Name, count(albums.AlbumId)
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId
GROUP BY artists.Name;
```

### Query 7: Writes a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes.

```
SELECT DISTINCT c.CustomerId, c.FirstName, c.LastName, (t.milliseconds)/60000 as minutes, (Select avg(milliseconds) from tracks)/60000 as average
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks t ON ii.TrackId = t.TrackId
WHERE t.Milliseconds > (
    SELECT AVG(Milliseconds) FROM tracks
)
AND t.Milliseconds <= 900000
GROUP BY c.customerid
ORDER BY c.customerid asc;
```

### Query 8: Writes a query that lists all the tracks that are not in one of the top 5 genres with longer duration in the database.

```
SELECT g.Name AS GenreName, g.genreid
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
WHERE t.GenreId NOT IN (
    SELECT g.GenreId
    FROM genres g
    JOIN tracks t ON g.GenreId = t.GenreId
    GROUP BY g.GenreId
    ORDER BY AVG(t.Milliseconds) DESC
    LIMIT 5);
```

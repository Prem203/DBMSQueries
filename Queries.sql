-- Query 1:
CREATE TABLE "MusicVideo" (
	"track_id"	INTEGER NOT NULL,
	"video_director"	TEXT,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("track_id"),
	FOREIGN KEY("track_id") REFERENCES "tracks"("TrackId"));

-- Query 2:
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

-- Query 3:
INSERT INTO MusicVideo (track_id, video_director, name)
SELECT TrackId, "Scorcesse", "Voodoo"
FROM tracks
WHERE name == "Voodoo";

-- Query 4:
SELECT * FROM tracks 
WHERE name LIKE "%ó%";

-- Query 5:
SELECT *
FROM tracks
FULL OUTER JOIN MusicVideo ON tracks.TrackId = MusicVideo.track_id;

-- Query 6:
SELECT artists.Name, count(albums.AlbumId)
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId
GROUP BY artists.Name;

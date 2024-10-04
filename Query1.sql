-- Query 1:
CREATE TABLE "MusicVideo" (
	"track_id"	INTEGER NOT NULL,
	"video_director"	TEXT,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("track_id"),
	FOREIGN KEY("track_id") REFERENCES "tracks"("TrackId"));
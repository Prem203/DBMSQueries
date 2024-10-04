-- Query 3:
INSERT INTO MusicVideo (track_id, video_director, name)
SELECT TrackId, "Scorcesse", "Voodoo"
FROM tracks
WHERE name == "Voodoo";

-- Query 5:
SELECT *
FROM tracks
FULL OUTER JOIN MusicVideo ON tracks.TrackId = MusicVideo.track_id;
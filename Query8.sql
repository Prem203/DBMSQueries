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
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
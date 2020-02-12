-- Practice joins
SELECT unit_price
FROM invoice_line
WHERE unit_price > .99

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
  JOIN customer c
  ON c.customer_id = i.customer_id

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
  JOIN employee e
  ON c.support_rep_id = e.employee_id

SELECT al.title, ar.name
FROM album al JOIN artist ar
  ON al.artist_id = ar.artist_id

SELECT PLT.track_id
FROM playlist_track PLT
  JOIN playlist PL
  ON PL.playlist_id = PLT.playlist_id
WHERE PL.name = 'Music'

SELECT t.name
FROM track t
  JOIN playlist_track pt
  ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

SELECT t.name
FROM track t
  JOIN playlist_track pt
  ON t.track_id = pt.track_id
  JOIN playlist p
  ON pt.playlist_id = p.playlist_id

SELECT t.name, al.title
FROM track t
  JOIN album al
  ON t.album_id = al.album_id
  JOIN genre g
  ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk'

-- Practice nested queries
-- Practice updating Rows
-- Group by
-- Use Distinct
-- Delete Rows
-- eCommerce Simulation
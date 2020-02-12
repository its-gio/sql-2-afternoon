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
SELECT *
FROM invoice
WHERE invoice_id IN (
  SELECT invoice_id
FROM invoice_line
WHERE unit_price > .99
)

SELECT *
FROM playlist_track
WHERE playlist_id in (
  SELECT playlist_id
FROM playlist
WHERE name = 'Music'
)

SELECT name
FROM track
WHERE track_id IN (
  SELECT track_id
FROM playlist_track
WHERE playlist_id = 5
)

SELECT *
FROM track
WHERE genre_id IN (
  SELECT genre_id
FROM genre
WHERE name = 'Comedy'
)

SELECT *
FROM track
WHERE album_id IN (
  SELECT album_id
FROM album
WHERE title = 'Fireball'
)

SELECT *
FROM track
WHERE album_id IN (
  SELECT album_id
FROM album
WHERE artist_id IN (
    SELECT artist_id
FROM artist
WHERE name = 'Queen'
    )
  )

-- Practice updating Rows
UPDATE customer
SET fax = null

UPDATE customer
SET company = 'Self'
WHERE company IS null

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett'

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl'

UPDATE track
SET composer = 'The darkness around us'
WHERE composer IS null AND genre_id IN (
	SELECT genre_id
  FROM genre
  WHERE name = 'Metal'
)



-- Group by
-- Use Distinct
-- Delete Rows
-- eCommerce Simulation
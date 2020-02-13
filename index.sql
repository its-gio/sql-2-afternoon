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
SELECT g.name, COUNT(*)
FROM track t
  JOIN genre g
  ON t.genre_id = g.genre_id
GROUP BY g.name

SELECT g.name, COUNT(*)
FROM genre g
  JOIN track t
  ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name

SELECT ar.name, COUNT(*)
FROM artist ar
  JOIN album al
  ON ar.artist_id = al.artist_id
GROUP BY ar.name

-- Use Distinct
SELECT DISTINCT composer
FROM track

SELECT DISTINCT billing_postal_code
FROM invoice

SELECT DISTINCT company
FROM customer

-- Delete Rows
DELETE FROM practice_delete
WHERE type = 'bronze'

DELETE FROM practice_delete
WHERE type = 'silver'

DELETE FROM practice_delete
WHERE value = 150

-- eCommerce Simulation
CREATE TABLE users
(
  user_id
    SERIAL PRIMARY KEY,
  email
    varchar
(50),
  first_name
    varchar
(50),
  last_name
    varchar
(50)
)

CREATE TABLE products
(
  product_id SERIAL PRIMARY KEY,
  name varchar(50),
  price float
)

CREATE TABLE orders
(
  order_id SERIAL PRIMARY KEY,
  order_group int,
  product_id int REFERENCES products(product_id),
  user_id int REFERENCES users(user_id)
)

INSERT INTO users
  (first_name, last_name, email)
VALUES
  ('Michael', 'Bay', 'mbay@bayham.com'),
  ('Sally', 'Sue', 'suehuey@lawyer.com'),
  ('Prep', 'Pomp', 'random@salman.com')

INSERT INTO products
  (name, price)
VALUES
  ('Milk', 9.99),
  ('Paper', 1.99),
  ('Pepsi Cola', 0.99)

INSERT INTO orders
  (order_group, user_id, product_id)
VALUES
  (1, 1, 2),
  (1, 1, 3),
  (2, 2, 1),
  (3, 1, 1),
  (4, 2, 1),
  (5, 3, 2),
  (5, 3, 1),
  (5, 3, 1),
  (6, 2, 1)

SELECT *
FROM products
WHERE product_id IN (
  SELECT product_id
FROM orders
WHERE product_id = 1
)

SELECT *
FROM products
WHERE product_id IN (
  SELECT product_id
FROM orders
)

SELECT price
FROM orders o
  JOIN products p
  ON o.product_id = p.product_id
WHERE order_id = 1

ALTER TABLE orders
ADD user_id int REFERENCES users(user_id)

SELECT *
FROM orders
  JOIN users
  ON orders.user_id = users.user_id
WHERE users.user_id = 3

SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id
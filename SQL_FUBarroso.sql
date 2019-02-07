#1a
USE sakila;
SELECT first_name, last_name
FROM actor;

#1b
SELECT CONCAT(`first_name`,' ', `last_name`) AS 'Actor Name' FROM `actor`;

#2a
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';

#2b
SELECT * FROM actor
WHERE last_name LIKE '%gen%';

#2c
SELECT * FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

#2d
SELECT country_id, country
FROM country          
WHERE country IN ('Afghanistan','Bangladesh','China');

#3a
ALTER TABLE actor
ADD description BLOB;

#3b
ALTER TABLE actor
DROP COLUMN description;

#4a
SELECT last_name, COUNT(last_name) as "Count last_name"
FROM actor
GROUP BY last_name;

#4b
SELECT last_name, COUNT(last_name) as "Count last_name"
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >=2;


#4c
UPDATE actor
SET first_name = 'Harpo'
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

#4d
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO';
#This didn't make sense but im following homework directions. This Changed All HARPOs to GROUCHO as well.

#5a
SHOW CREATE TABLE address;

#6a
SELECT first_name, last_name, address 
FROM staff JOIN address ON (staff.address_id = address.address_id);

#6b
SELECT first_name, last_name, SUM(amount) AS 'Total Amount Rung Up'
FROM staff 
JOIN payment ON (staff.staff_id=payment.staff_id) 
WHERE payment_date LIKE '2005-08-%'
GROUP BY payment.staff_id;

#6c
SELECT title, COUNT(actor_id) AS 'Actors Listed'
FROM film
INNER JOIN film_actor ON (film.film_id = film_actor.film_id)
GROUP BY title;

#6d
SELECT title, COUNT(inventory_id) AS 'Existing Copies'
FROM film
JOIN inventory ON (film.film_id = inventory.film_id)
WHERE title='Hunchback Impossible'
GROUP BY title;

#6e
SELECT first_name, last_name, SUM(amount) AS 'Totals Paid'
FROM customer
JOIN payment ON (customer.customer_id = payment.customer_id)
GROUP BY customer.customer_id
ORDER BY last_name;

#7a
SELECT title FROM film
WHERE language_id in
	(SELECT language_id 
	FROM language
	WHERE name = "English" )
AND (title LIKE "K%") OR (title LIKE "Q%");

#7b
SELECT last_name, first_name
FROM actor
WHERE actor_id in
	(SELECT actor_id FROM film_actor
	WHERE film_id in 
		(SELECT film_id FROM film
		WHERE title = "Alone Trip"));
        
#7c
SELECT first_name, last_name, email
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Canada';

#7d
SELECT title, category
FROM film_list
WHERE category = 'Family';

#7e
SELECT title, COUNT(rental_id) FROM film 
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY title
ORDER BY COUNT(rental_id) DESC;

#7f
SELECT store.store_id, SUM(amount) AS 'Dollar Amt' FROM store 
JOIN staff ON (store.store_id = staff.store_id)
JOIN payment ON (staff.staff_id = payment.staff_id)
GROUP BY store.store_id;

#7g

SELECT store.store_id, city.city, country.country FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

#7h




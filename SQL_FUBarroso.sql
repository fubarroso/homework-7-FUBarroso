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
#This didn't make sense but im following homework directions. This Changed other rows to GROUCHO as well.

#5a
SHOW CREATE TABLE address;

#6a
SELECT first_name, last_name, address 
FROM staff JOIN address ON (staff.address_id = address.address_id);

#6b

#6c
#6d
#6e


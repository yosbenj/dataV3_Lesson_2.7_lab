# Lab | SQL Join (Part I)

# Instructions
# 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;

SELECT * FROM category c;
SELECT * FROM film_category;

SELECT c.name AS category_name, COUNT(DISTINCT fc.film_id) AS movies_count
FROM category c
JOIN film_category fc
USING(category_id)
GROUP BY fc.category_id;


# 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM payment p;
SELECT * FROM staff s;
SELECT payment_date FROM payment;

SELECT s.staff_id, SUM(p.amount)
FROM staff s
JOIN payment p 
USING (staff_id)
WHERE p.payment_date LIKE "2005-08%"
GROUP BY p.staff_id;


# 3. Which actor has appeared in the most films?
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(*) AS movies_count
FROM actor a
JOIN film_actor fa
USING (actor_id)
GROUP BY a.actor_id, actor_name
ORDER BY movies_count DESC
LIMIT 1;


# 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer;
SELECT * FROM rental;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(*) AS rental_count
FROM customer c
JOIN rental r 
USING (customer_id)
GROUP BY c.customer_id, customer_name
ORDER BY rental_count DESC
LIMIT 1;


# 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;

SELECT staff_id, first_name, last_name, address_id
FROM staff;


# 6. List each film and the number of actors who are listed for that film.
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT f.title AS film_title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa
USING (film_id)
GROUP BY f.title;


# 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM payment;
SELECT * FROM customer;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p 
USING (customer_id)
GROUP BY c.customer_id, customer_name
ORDER BY c.last_name, c.first_name;


# 8. List the titles of films per category.
SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;

SELECT c.name AS category, GROUP_CONCAT(f.title ORDER BY f.title ASC) AS film_titles
FROM category c
JOIN film_category fc 
USING (category_id)
JOIN film f 
USING (film_id)
GROUP BY c.name;

USE sakila;

SELECT * FROM store;

SELECT * FROM payment;

# QUESTION 1.  Display all available tables in the Sakila database.
SHOW TABLES;

# QUESTION 2. Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

# QUESTION 3. Retrieve the following columns from their respective tables:
# 3.1 Titles of all films from the film table
SELECT title FROM film;

# 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT * FROM language;

SELECT name AS language FROM language;

# 3.3 List of first names of all employees from the staff table
SELECT first_name FROM staff;

# QUESTION 4. Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

# QUESTION 5. Counting records for database insights:
# 5.1 Determine the number of stores that the company has.
SELECT COUNT(*) AS number_of_stores FROM store;

# 5.2 Determine the number of employees that the company has.
SELECT COUNT(*) AS number_of_employees FROM staff;

# 5.3 Determine how many films are available for rent and how many have been rented.
SELECT
    (SELECT COUNT(*) FROM film) AS total_films,
    (SELECT COUNT(*) FROM rental) AS rented_films;
    
# repasar que es este codigo para que es. 
SELECT COUNT(DISTINCT inventory_id) AS number_of_copies, COUNT(DISTINCT(film_id)) AS number_of_titles
FROM sakila.inventory;

# 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS distinct_last_names FROM actor;

# QUESTION 6. Retrieve the 10 longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

# QUESTION 7. Use filtering techniques in order to:
# 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor WHERE first_name = 'SCARLETT';

# 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

# profe
SELECT title, length 
FROM film 
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;


# 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) AS behind_the_scenes_films
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

# profe
SELECT COUNT(*)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';



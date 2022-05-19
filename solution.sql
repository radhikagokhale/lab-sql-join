use sakila;

-- 1. List the number of films per category.
SELECT category_id, COUNT(DISTINCT (film_id)) as amoun_of_films
FROM sakila.film_category
GROUP BY category_id;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff as s
JOIN sakila.address as a
ON s.address_id=a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT s.first_name,s.last_name,s.staff_id,p.amount
FROM sakila.staff as s
JOIN sakila.payment as p
ON s.staff_id=p.staff_id
WHERE LEFT(p.payment_date,7)='2005-08';

SELECT first_name,last_name,staff_id,SUM(amount)
FROM sakila.staff_pay_amounts
GROUP BY staff_id;

-- 4. List all films and the number of actors who are listed for each film.
SELECT f.title,f.film_id, COUNT(DISTINCT(actor_id)) as count_of_actors
FROM sakila.film_actor a
JOIN  sakila.film f
ON a.film_id=f.film_id
GROUP BY film_id;


-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.

SELECT c.customer_id,c.first_name, c.last_name,SUM(p.amount) as paid_by_customer
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id=p.customer_id
GROUP BY c.first_name, c.last_name,c.customer_id
ORDER BY c.last_name;

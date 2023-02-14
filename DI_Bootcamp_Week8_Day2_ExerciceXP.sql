-- DI_Bootcamp_Week8_Day2_ExerciceXP

-- Exercise 1 : Items And Customers

-- 1 /Use SQL to get the following from the database:
-- 1 All items, ordered by price (lowest to highest).
SELECT * FROM public.items ORDER BY items.price;

-- 2 /Items with a price above 80 (80 included), ordered
--by price (highest to lowest).
SELECT * FROM public.items  WHERE items.price > 80 ORDER BY items.price;

-- 3/ The first 3 customers in alphabetical order of the 
-- first name (A-Z) – exclude the primary key column from the results.
SELECT * FROM public.customers  ORDER BY customers.last_name;

-- 4/ All last names (no other columns!), in reverse alphabetical order (Z-A)
SELECT customers.last_name FROM public.customers  ORDER BY customers.last_name DESC;


-- Exercice2
-- 1/In the dvdrental database write a query to select all the columns from the “customer” table.
SELECT * FROM public.customer;

-- 2/Write a query to display the names (first_name, last_name) using an alias named “full_name”.
SELECT first_name ||' '|| last_name as full_name FROM public.customer;

-- 3/Write a query to display the names (first_name, last_name) using an alias named “full_name”.
SELECT DISTINCT(create_date) FROM public.customer;

-- 4/Write a query to get all the customer details from the customer table, it should be displayed in descending order by their first name.
SELECT * FROM public.customer ORDER BY first_name DESC;

-- 5/Write a query to get the film ID, title, description, year of release and rental rate in ascending order according to their rental rate.
SELECT film_id, title, description, release_year, rental_rate FROM public.film ORDER BY rental_rate ASC;

--6 /Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT address, phone  FROM public.address WHERE district  LIKE'Texas';

--7 /Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT * FROM public.film WHERE film_id in (15,150);

--8 /Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT film_id, title, description, film.length, rental_rate  FROM public.film  WHERE title ILIKE ' appolo teen' ;

--9 /Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT film_id, title, description, film.length, rental_rate  FROM public.film  WHERE title ILIKE 'ap%' ;

-- 10 /Write a query which will find the 10 cheapest movies.
SELECT * FROM public.film ORDER BY  rental_rate LIMIT 10;

-- 11 / Not satisfied with the results. Write a query which will find the next 10 cheapest movies.
-- Bonus: Try to not use LIMIT.
SELECT * FROM public.film ORDER BY  rental_rate LIMIT 10 OFFSET 10 ;

--12 /Write a query which will join the data in the customer table and the payment table. You want to get the first name and last name from the curstomer table,
-- as well as the amount and the date of every payment made by a customer, ordered by their id (from 1 to…).
SELECT first_name, last_name, amount, payment_date FROM public.customer INNER JOIN public.payment ON  payment.customer_id = customer.customer_id;

--13 /Write a query which will join the data in the customer table and the payment table. You want to get the first name and last name from the curstomer table, 
-- as well as the amount and the date of every payment made by a customer, ordered by their id (from 1 to…).
SELECT * FROM public.film LEFT JOIN public.inventory on film.film_id = inventory.film_id  WHERE inventory.film_id IS NULL;

--14 /Write a query which will join the data in the customer table and the payment table. You want to get the first name and last name from the curstomer table, 
-- as well as the amount and the date of every payment made by a customer, ordered by their id (from 1 to…).
SELECT city, country  FROM public.city INNER JOIN public.country on city.city_id = country.country_id;

--15 /Bonus You want to be able to see how your sellers have been doing? Write a query to get the customer’s id, names (first and last), the amount and the date of payment ordered by the id of the staff member who sold them the dvd.
SELECT customer.customer_id, customer.first_name||' '||customer.last_name as fullname, payment.amount, payment.payment_date, staff.first_name, staff.last_name, film.title FROM public.customer 
INNER JOIN public.payment ON payment.customer_id = customer.customer_id 
INNER JOIN public.staff ON staff.staff_id = payment.staff_id
INNER JOIN public.rental ON rental.rental_id = staff.staff_id
INNER JOIN public.inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN public.film ON film.film_id = inventory.inventory_id;





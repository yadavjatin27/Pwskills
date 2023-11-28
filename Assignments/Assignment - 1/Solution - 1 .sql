use mavenmovies;

-- // ques 1  Identify the primary keys and foreign keys in maven movies db. Discuss the differences //--

desc actor;
-- (1)-- in table actor "actor_id" is PRIMARY KEY and "last_name" is FOREIGN KEY --

desc actor_award; 
-- (2) -- in table actor_award "actor_award_id" is PRIMARY KEY and "last_name" is FOREIGN KEY--

desc address;
-- (3) -- in table address "address_id" is PRIMARY KEY and "city_id" is FOREIGN KEY --

desc advisor;
-- (4) -- in table advisor "advisor_id" is PRIMARY KEY and no foreign key

desc category;
-- (5) -- in table category "category_id " is PRIMARY KEY and no foreign key

desc city;
-- (6) -- int table city "city_id" is PRIMARY KEY and "country_id" is FOREIGN KEY

desc country;
-- (7) -- int table country "country_id" is PRIMARY KEY and no FOREIGN KEY

desc customer;
-- (8) -- int table customer "customer_id" is PRIMARY KEY and "store_id, last_name, address_id " is FOREIGN KEY

desc film;
-- (9) -- int table film "film_id" is PRIMARY KEY and "title, language_id, original_language_id" is FOREIGN KEY

desc film_actor;
-- (10) -- int table film_actor "actor_id, film_id" is PRIMARY KEY and no FOREIGN KEY

desc film_category;
-- (11) -- int table film_category "film_id, category_id " is PRIMARY KEY and "" is FOREIGN KEY

desc film_text;
-- (12) -- int table film_text "film_id" is PRIMARY KEY and "title" is FOREIGN KEY

desc inventory;
-- (13) -- int table inventory "inventory_id" is PRIMARY KEY and "film_id,store_id " is FOREIGN KEY

desc investor;
-- (14) -- int table investor "investor_id" is PRIMARY KEY and no FOREIGN KEY

desc language;
-- (15) -- int table language "language_id" is PRIMARY KEY and no FOREIGN KEY

desc payment;
-- (16) -- int table payment "payment_id" is PRIMARY KEY and "customer_id, staff_id,rental_id " FOREIGN KEY

desc rental;
-- (17) -- int table rental "rental_id" is PRIMARY KEY and "rental_date,inventory_id, customer_id, staff_id " FOREIGN KEY

desc staff;
-- (18) -- int table staff "staff_id" is PRIMARY KEY and "address_id, store_id" FOREIGN KEY

desc store;
-- (19) -- int table store "store_id" is PRIMARY KEY and "address_id" FOREIGN KEY


SELECT 
    *
FROM
    actor;


-- // QUES 3  List all customer information from DB //--

SELECT 
    *
FROM
    customer;

-- // QUES 4 List different countries. //--

SELECT 
    *
FROM
    country;

-- // QUES 5 Display all active customers.// -- 

SELECT 
    *
FROM
    customer
WHERE
    active = '1';

-- // Ques 6 List of all rental IDs for customer with ID 1. // --

SELECT 
    *
FROM
    rental
WHERE
    customer_id = '1';

-- // QUES 7 Display all the films whose rental duration is greater than 5 //--

SELECT 
    film_id, title, rental_duration
FROM
    film
WHERE
    rental_duration > 5;


-- // Ques 8 List the total number of films whose replacement cost is greater than $15 and less than $20. // --

SELECT 
    film_id, title, replacement_cost
FROM
    film
WHERE
    replacement_cost >= 15
        AND replacement_cost <= 20;


-- // Ques 9 Display the count of unique first names of actors.//--

SELECT 
    COUNT(DISTINCT SUBSTRING_INDEX(first_name, ' ', 1)) AS unique_first_names
FROM
    actor;


-- Ques 10 Display the first 10 records from the customer table .// -- 
SELECT 
    *
FROM
    customer
WHERE
    customer_id <= 10;


-- Ques 11 Display the first 3 records from the customer table whose first name starts with ‘b’. // --
select * from customer where first_name like "b%" limit 3;

-- Ques 12 Display the names of the first 5 movies which are rated as ‘G’.// --
select title, rating from film where rating = "G" limit 5;


-- Ques 13 Find all customers whose first name starts with “a”. //--
select * from customer where first_name like "a%";


-- Ques 14 Find all customers whose first name ends with “a”. // --
select * from customer where first_name like "%a";


-- Ques 15 Display the list of first 4 cities which start and end with ‘a’ . // --
select * from city where city like "a%a" limit 4;


-- Ques 16 Find all customers whose first name have “NI” in any position. // -- 
select * from customer where first_name like "%ni%";


-- Ques 17 Find all customers whose first name have “r” in the second position . //--
 select * from customer where first_name like "_r%";
 
 
 -- Ques 18 Find all customers whose first name starts with “a” and are at least 5 characters in length. //--
select * from customer where first_name like "a%" and length(first_name)>=5;


-- Ques 19 Find all customers whose first name starts with “a” and ends with “o”. //--
select * from customer where first_name like "a%o";


-- Ques 20 Get the films with pg and pg-13 rating using IN operator. // --
select title, rating from film where rating in("pg","pg-13"); 


-- Ques 21  Get the films with length between 50 to 100 using between operator. //--
select title, length from film where length between 50 and 100;


-- Ques 22 Get the top 50 actors using limit operator. //--
 select * from actor order by actor_id limit 50;
 
 
 -- ques 23 Get the distinct film ids from inventory table. // -- 
 select distinct film_id from inventory; 

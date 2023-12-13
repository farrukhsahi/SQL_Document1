-- 1. How many actors are there with the last name ‘Wahlberg’?
select count(*) as actor_count
from actor
where last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
select count(*) as NumberOfPayments
from payment
where amount between 3.99 and 5.99

-- 3. What film does the store have the most of? (search in inventory)
select * from inventory
select film_id, count(*) as ValueCount
from inventory
group by film_id;

-- 4. How many customers have the last name ‘William’?
select count(*) as customers_count
from customers
where last_name = 'Willian';

-- 5. What store employee (get the id) sold the most rentals?
select staff_id as EmployeeId, count(rental_id) as TotalRentals
from rental
group by staff_id
order by TotalRentals desc
limit 1;

-- 6. How many different district names are there?
select count(distinct district) as NumberOfDistricts
from address

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id) as NumberOfActors
from film_actor
group by film_id
order by NumberOfActors desc
limit 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(*) as NumberOfCustomers
from customer
where store_id = 1 and last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select * from payment
select amount, count(distinct rental_id) as RentalCount
from payment
where customer_id between 380 and 430
group by amount
having count (distinct rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- 1. How many rating categories:
select * from film
select count(distinct rating) as NumberOfRatingCategories
from film;
-- What rating has the most movies total:
select rating, count(film_id) as NumberOfMovies
from film
group by rating
order by NumberOfMovies desc
limit 1;

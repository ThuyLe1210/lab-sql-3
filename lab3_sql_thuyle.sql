-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) from film;
-- How many movies were released with "PG-13" rating?
select count(film_id) from film where rating = 'PG-13';
-- Get 10 the longest movies from 2006.*
select title, length, release_year from film where release_year = '2006'order by length desc limit 10;
-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as Datediff from rental;
-- Show rental info with additional columns month and weekday. Get 20.
select *,  date_format(rental_date,"%M") as month, weekday(rental_date) as weekday from rental limit 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *, DATE_FORMAT(RENTAL_DATE,"%M") as month, weekday(RENTAL_DATE) as weekday,
case
when weekday(rental_date) <=4 Then "weekday"
else "weekend"
END as day_type
from rental;
-- How many rentals were in the last month of activity?
select count(rental_date) from rental where rental_date > current_date() - interval 5864 day;

select rental_date from rental;
select max(rental_date) -interval 1 month from rental;
select count(rental_id) from rental where rental_date > (select max(rental_date) -interval 1 month from rental) ;

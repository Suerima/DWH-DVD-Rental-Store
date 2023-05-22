-- film
select f.film_id, title, c.name as category, rental_duration, rental_rate, length, replacement_cost, rating, special_features, STRING_AGG((a.first_name + ' ' + a.last_name), ', ') as actors
from film f, film_category fc, category c, film_actor fa, actor a
where f.film_id = fc.film_id and  c.category_id = fc.category_id and fa.film_id = f.film_id and fa.actor_id = a.actor_id	 
group by f.film_id, title, c.name, rental_duration, rental_rate, length, replacement_cost, rating, special_features
order by f.film_id

select * from film
where film_id = 257
UPDATE film_new

select * from film_category
where film_id = 257
--- 257, 323, 803
select * from category
where category_id = 16

select * from film_actor
where film_id = 803

SET special_features = REPLACE(special_features, ',', '; ');

select * from film_new

-- 257	DRUMLINE CYCLONE	Travel	3	0.99	110	14.99	G	Commentaries,Deleted Scenes,Behind the Scenes	FAY KILMER, GENE WILLIS, SUSAN DAVIS, LUCILLE DEE
-- 323	FLIGHT LIES	Sports	7	4.99	179	22.99	R	Trailers	VAL BOLGER, JUDE CRUISE, ADAM GRANT, JAMES PITT, FRANCES TOMEI
-- 803	SLACKER LIAISONS	Drama	7	4.99	179	29.99	R	Trailers,Commentaries,Behind the Scenes	HELEN VOIGHT, AUDREY OLIVIER, JADA RYDER, CHRIS DEPP, LAURENCE BULLOCK, JAYNE SILVERSTONE

select * 
from film
where film_id = 803


-- count number actors
SELECT actor_name, COUNT(DISTINCT film_id) AS movie_count
FROM (
  SELECT film_id, TRIM(value) AS actor_name
  FROM film_n
  CROSS APPLY STRING_SPLIT(actors, ',')
) AS actor_film
GROUP BY actor_name
ORDER BY movie_count DESC;

select a.actor_id, n.movie_count
from actor_n n left join actor_new a
	  on n.actor_name = a.name
order by actor_id

select * 
from actor_new

select *
from actor_n
order by movie_count

select *  
from film

--- 257, 323, 803

select film_id, actors 
into actor_S
from film_n
order by film_id

select * 
from category

insert into actor_S
values(257, 'WALTER TORN'),
	(323, 'WALTER TORN'),
	(803, 'WALTER TORN')

select * from film_actor_new
select * from category

select film_id, c.category_id, name
from film_category as fc
     inner join category c on fc.category_id = c.category_id
order by film_id

select * from actor_S



select * from film_new2


update film_new2
SET special_features = REPLACE(special_features, ',', ';')


select film_id, actors
from film_new
order by film_id

select f.film_id, fc.category_id, a.film_id as actor_id, title, description, rental_duration, rental_rate, length, replacement_cost, rating, special_features 
from film f 
	 inner join film_category_ne fc on f.film_id = fc.film_id
	 inner join actor_S a on f.film_id = a.film_id
select * from film_new2
-- address
select a.address_id, address, c.city, co.country
from address a, city c, country co
where a.city_id = c.city_id and c.country_id = co.country_id 

select * 
from film_actor fa, actor a
where fa.actor_id = a.actor_id and a.actor_id = 1

-- payment
select r.rental_id, rental_date, inventory_id, r.customer_id, return_date, amount, payment_date
into rental_new
from rental r inner join payment p on r.rental_id = p.rental_id

select * from payment

select * from inventory

--
select *
from payment p, rental r, customer c
where p.rental_id = r.rental_id and c.customer_id = p.customer_id

-- address
select a.address_id, address, c.city, co.country
from address a, city c, country co
where a.city_id = c.city_id and c.country_id = co.country_id 

-- customer
select c.customer_id, (first_name + ' ' + last_name) name, email, address, city, country
into customer_new
from customer c, address_new a
where c.address_id = a.address_id


select * from customer

select * from film_new

-- inventory
select *

from inventory

-- payment
-- pay: 424, 7011, 10840, 14675, 15458
-- cus: 16 (2247), 259(15592), 401 (6579), 546(9426), 577 (321)
-- ren: 2247, 15592, 6579, 9426, 321


insert into rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (2247, '2005-06-18 04:58:38.000', 1, 16, '2005-06-20 22:04:30.000', 1, '2006-02-15 21:30:53.000'), 
	   (15592, '2005-08-23 06:13:18.000', 2, 259, '2005-08-26 22:04:30.000', 1, '2006-02-15 21:30:53.000'),
	   (6579, '2005-07-12 06:20:45.000', 3, 401, '2005-07-15 22:04:30.000', 1, '2006-02-15 21:30:53.000'),
	   (9426, '2005-07-30 21:13:19.000', 4, 546, '2005-08-01 22:04:30.000', 1, '2006-02-15 21:30:53.000'),
	   (321, '2005-05-27 00:20:48.000', 5, 577, '2005-05-28 22:04:30.000', 2, '2006-02-15 21:30:53.000')

select * from rental where rental_id = 2247
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
select * from film_category

----- FILM CATEGORY ------
select f.film_id, c.name
into film_category_new
from film_category  f inner join category c 
	 on f.category_id = c.category_id


----- FILM ------
select f.film_id ,f.title, f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating, f.special_features
into film_new
from film f 

UPDATE film_new
SET special_features = REPLACE(special_features, ';', '; ')

---- FILM ACTOR
select film_id, (a.first_name + ' ' + a.last_name) as fullname
into film_actor_new
from film_actor f inner join actor a
	on f.actor_id = a.actor_id

-----  inventory ----
select i.inventory_id, i.film_id, i.store_id 
into invetory_new
from inventory i

------ rental -----
select r.rental_id, r.rental_date, r.inventory_id, r.customer_id, r.return_date
into rental_new
from rental r

------- customer ----
select c.customer_id, c.store_id, (c.first_name + ' ' + c.last_name) as fullname, c.address_id
into customer_new
from customer c

----- payment -----
select payment_id, customer_id, rental_id, amount, payment_date
into payment_new
from payment

----- store ----
select store_id, address_id
into store_new
from store

truncate table inventory

select * from stgAddress


drop table stgFilm
drop table stgFilm_actor
drop table stgFilm_category
drop table stgInventory
drop table stgPayment
drop table stgRental
drop table stgStore
drop table stgAddress

Truncate table stgFilm
Truncate table stgFilm_actor
Truncate table stgFilm_category
Truncate table stgInventory
Truncate table stgPayment
Truncate table stgRental
Truncate table stgStore
Truncate table stgAddress
Truncate table stgCustomer

drop table DimAddress
drop table DimCustomer
drop table DimFilm
drop table DimFilm_actor
drop table DimFilm_category
drop table DimInventory
drop table DimPayment
drop table DimRental
drop table DimStore

Truncate table DimPayment;
Truncate table DimRental;
Truncate table DimCustomer;
Truncate table DimInventory;
Truncate table DimStora;
Truncate table DimFilm_category;
Truncate table DimFilm_actor;
Truncate table DimFilm;
Truncate table DimAddress;
Truncate table DimDate

CREATE TABLE [DimAddress] (
    [address_id] int primary key,
    [address] nvarchar(255),
    [city] nvarchar(255),
    [country] nvarchar(255)
)


CREATE TABLE [DimStore] (
    [store_id] int primary key,
    [address_id] int  FOREIGN KEY REFERENCES DimAddress(address_id)
)


CREATE TABLE [DimCustomer] (
    [customer_id] int primary key,
    [store_id] int FOREIGN KEY REFERENCES DimStore(store_id),
    [fullname] nvarchar(255),
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id)
)

CREATE TABLE [DimFilm] (
    [film_id] int primary key,
    [title] nvarchar(255),
    [rental_duration] float,
    [rental_rate] float,
    [length] float,
    [replacement_cost] float,
    [rating] nvarchar(255),
    [special_features] nvarchar(255)
)

CREATE TABLE [DimFilm_actor] (
    [film_id] int  FOREIGN KEY REFERENCES DimFilm(film_id),
    [fullname] nvarchar(255)
)

CREATE TABLE [DimFilm_category] (
    [film_id] int FOREIGN KEY REFERENCES DimFilm(film_id),
    [name] nvarchar(255)
)

CREATE TABLE [DimInventory] (
    [inventory_id] int primary key,
    [film_id] int   FOREIGN KEY REFERENCES DimFilm(film_id),
    [store_id] int  FOREIGN KEY REFERENCES DimStore(store_id)
)


CREATE TABLE [DimRental] (
    [rental_id] int primary key,
    [inventory_id] int FOREIGN KEY REFERENCES DimInventory(inventory_id),
    [customer_id] int FOREIGN KEY REFERENCES DimCustomer(customer_id),
    [rental_date] datetime,
    [return_date] datetime
)

CREATE TABLE [DimPayment] (
    [payment_id] int primary key,
    [rental_id] int FOREIGN KEY REFERENCES DimRental(rental_id),
    [amount] float,
    [payment_date] datetime
)


SELECT
FROM DimCustomer ID



---------
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [inventory_id]
      ,[film_id]
      ,[store_id]
  FROM [SakilaDW].[dbo].[DimInventory]



select inventory_id
from Rental
order by inventory_id

select * from inventory

select customer_id, inventory_id
from rental
order by customer_id, inventory_id

SELECT film_id, COUNT(DISTINCT customer_id) AS repeat_customers
FROM rental  r inner join inventory i on r.inventory_id = i.inventory_id 
GROUP BY film_id
HAVING COUNT(*) >= 2;


SELECT customer_id,  COUNT(DISTINCT film_id) AS repeat_films
FROM rental  r inner join inventory i on r.inventory_id = i.inventory_id 
GROUP BY customer_id
HAVING COUNT(*) >= 2
ORDER BY customer_id


SELECT customer_id, film_id, COUNT(*) AS repeat_rentals
FROM rental  r inner join inventory i on r.inventory_id = i.inventory_id 
GROUP BY customer_id, film_id
HAVING COUNT(*) >= 2;

select *
from rental
where customer_id = 198
order by inventory_id

select * from inventory
where film_id = 966

--s.store_id, f.film_id, f.rental_rate, f.rental_duration, COUNT(f.film_id) as SL_film
select f.film_id,  COUNT(f.film_id) as SL_film
from store s 
	 inner join inventory i on s.store_id = i.store_id
	 inner join film f on i.film_id = i.film_id
	 inner join rental r on  i.inventory_id = r.inventory_id
	 inner join payment p on r.rental_id = p.payment_id
group by f.film_id
order by f.film_id



select q.*
from (select s.store_id, i.film_id, f.rental_rate, f.rental_duration ,COUNT(i.film_id) SL 
	  from store s
			inner join inventory i on s.store_id = i.store_id
			inner join film f on i.film_id = f.film_id
	  group by s.store_id, i.film_id, f.rental_rate, f.rental_duration) as q
	  left join inventory i on q.film_id = i.film_id
group by q.store_id, q.film_id, q.rental_rate, q.rental_duration, q.SL
order by q.store_id, q.film_id


select r.rental_id, s.store_id,  i.film_id, f.rental_rate, f.rental_duration, p.amount, DATEDIFF(day, r.rental_date, r.return_date) SumDateRental
from rental r
	inner join payment p on r.rental_id = p.rental_id
	inner join inventory i on i.inventory_id= r.inventory_id
	inner join store s on s.store_id = i.store_id
	inner join film f on i.film_id = f.film_id
order by store_id, film_id
	  --inner join inventory i on Q.film_id = i.film_id

	  -- film 499
select s.store_id,  i.film_id, f.rental_rate, f.rental_duration,
	  Sum(p.amount) SumAmount, 
	  FORMAT(Round(Sum(p.amount - (f.rental_rate / f.rental_duration) * DATEDIFF(day, r.rental_date, r.return_date)), 2), 'N2') Sum_Profit_early,
	  Sum(p.amount - rental_rate) Sum_Profit_lately
from rental r
	inner join payment p on r.rental_id = p.rental_id
	inner join inventory i on i.inventory_id= r.inventory_id
	inner join store s on s.store_id = i.store_id
	inner join film f on i.film_id = f.film_id
group by s.store_id,  i.film_id, f.rental_rate, f.rental_duration
order by s.store_id,  i.film_id, f.rental_rate, f.rental_duration


SELECT * FROM rental r
	inner join payment p on  r.rental_id = p.rental_id
WHERE return_date is null


-----------



select * 
from payment
where DATEPART(year, payment_date) = 2006


DELETE FROM stgPayment 
WHERE DATEPART(year, payment_date) = 2006

DELETE FROM stgRental
WHERE DATEPART(year, rental_date) = 2006

-- file:///C:/Users/TotNguyen/Downloads/Documents/31815308.pdf

CREATE TABLE [stgAddress] (
    [address_id] int,
    [address] nvarchar(255),
    [city] nvarchar(255),
    [country] nvarchar(255)
)
CREATE TABLE [stgStaff] (
    [staff_id] int,
    [first_name] nvarchar(255),
    [last_name] nvarchar(255),
    [address_id] float,
    [store_id] int,
    [email] nvarchar(255)
)

CREATE TABLE [stgStore] (
    [store_id] int,
    [staff_id] int,
    [address_id] int
)
CREATE TABLE [stgCategory] (
    [category_id] int,
    [name] nvarchar(255)
)
CREATE TABLE [stgActor] (
    [actor_id] int,
    [actors] nvarchar(255)
)
CREATE TABLE [stgFilm] (
    [film_id] int,
	[category_id] int,
	[actor_id] int,
    [title] nvarchar(255),
    [description] nvarchar(255),
    [rental_duration] float,
    [rental_rate] float,
    [length] float,
    [replacement_cost] float,
    [rating] nvarchar(255),
    [special_features] nvarchar(255)
)
CREATE TABLE [stgCustomer] (
    [customer_id] int,
    [store_id] int,
    [first_name] nvarchar(255),
    [last_name] nvarchar(255),
    [email] nvarchar(255),
    [address_id] int
)

CREATE TABLE [stgDate] (
    [date key] int,
    [full date] datetime,
    [day of week] int,
    [day num in month] int,
    [day num overall] int,
    [day name] nvarchar(255),
    [weekday flag] nvarchar(255),
    [week num in year] int,
    [month] int,
    [month name] nvarchar(255),
    [quarter] int,
    [year] int
)
CREATE TABLE [stgInventory] (
    [store_id] int,
    [inventory_id] int,
    [film_id]  int
)
CREATE TABLE [stgRental] (
    [rental_id] int,
    [customer_id] int,
    [film_id] int,
    [staff_id] int,
    [store_id] int,
    [rental_date_key] int,
    [return_date_key] int,
    [amount] float,
    [rental_duration] int,
    [rental_rate] float,
    [TotalRentalTime] int,
    [ProfitReturnEarly] float,
    [ProfitReturnLate] float
)
---------------------------------------------------------
CREATE TABLE [DimAddress] (
    [address_id] int primary key,
    [address] nvarchar(255),
    [city] nvarchar(255),
    [country] nvarchar(255)
)

CREATE TABLE [DimActor] (
	[actor_id] int primary key,
	[actors] nvarchar(255)
)

CREATE TABLE [DimStore] (
    [store_id] int primary key,
    [staff_id] int,
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id), 
)
CREATE TABLE [DimStaff] (
    [staff_id] int primary key,
    [name] nvarchar(255),
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id),
    [store_id] int,
    [email] nvarchar(255)
)
CREATE TABLE [DimCustomer] (
    [customer_id] int primary key,
    [name] nvarchar(255),
    [email] nvarchar(255),
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id)
)
CREATE TABLE [DimFilm] (
    [film_id] int primary key,
	[category_id] int FOREIGN KEY REFERENCES DimCategory(category_id),
	[actor_id] int FOREIGN KEY REFERENCES DimActor(actor_id),
    [title] nvarchar(255),
    [description] nvarchar(255),
    [rental_duration] float,
    [rental_rate] float,
    [length] float,
    [replacement_cost] float,
    [rating] nvarchar(255),
    [special_features] nvarchar(255)
)
CREATE TABLE [DimCategory] (
    [category_id] int primary key,
    [name] nvarchar(255)
)



CREATE TABLE [DimDate] (
    [date key] int primary key,
    [full date] datetime,
    [day of week] int,
    [day name] nvarchar(255),
	[day num in month] int,
    [day num overall] int,
    [weekday flag] nvarchar(255),
    [week num in year] int,
    [month] int, 
    [month name] nvarchar(255),
    [quarter] int,
    [year] int
)

CREATE TABLE [FactRental] (
    [rental_id] int primary key,
    [customer_id] int,
    [film_id] int,
    [staff_id] int,
    [store_id] int,
    [rental_date_key] int,
    [return_date_key] int,
    [amount] float,
    [rental_duration] int,
    [rental_rate] float,
    [TotalRentalTime] int,
    [ProfitReturnEarly] float,
    [ProfitReturnLate] float
)


---
truncate table DimDate
truncate table DimCategory
truncate table DimActor
truncate table DimFilm
truncate table DimStaff
truncate table DimStore
truncate table DimCustomer
truncate table DimAddress

----
-- Số lần thuê của từng khách hàng
select c.name, count(*) as total
from FactRental f
	 inner join DimCustomer c on f.customer_id = c.customer_id
group by  c.name
order by total DESC

select * from FactRental
--
--1
select store_id, count(*)
from FactRental
group by store_id
--2
select f.store_id, film_id
	from FactRental f 
	group by f.store_id, film_id


select store_id, film_id
from inventory
where store_id = 2
group by store_id, film_id


-- 4
select store_id, d.month, sum(amount) amount
from FactRental f
	 inner join DimDate d on f.return_date_key = d.[date key] 
group by d.month, store_id 


-- 6
select c.name , count(*) soLuong
from FactRental f 
	 inner join DimFilm d on f.film_id = d.film_id
	 inner join DimCategory c on d.category_id = c.category_id
group by c.name
order by soLuong DESC

select q.customer_id, COUNT(rental_id) soLanThue, q.soLanTraMuon , Round((Convert(float, q.soLanTraMuon) / COUNT(rental_id))*100, 2) AS tyLe
from FactRental f inner join (select customer_id, count(rental_id) soLanTraMuon
								from FactRental f
								WHERE ProfitReturnEarly = 0
								group by customer_id) q on f.customer_id = q.customer_id

group by q.customer_id, q.soLanTraMuon
order by tyLe desc

select customer_id, count(rental_id) soLanTraMuon
from FactRental f
WHERE ProfitReturnEarly = 0
group by customer_id
order by customer_id

	 
select store_id, sum(ProfitReturnEarly)
from FactRental
group by store_id
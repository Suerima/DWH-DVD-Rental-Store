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


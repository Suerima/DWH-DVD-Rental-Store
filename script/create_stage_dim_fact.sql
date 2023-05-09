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
    [film_id] int,
    [name] nvarchar(255)
)
CREATE TABLE [stgActor] (
    [film_id] int,
    [fullname] nvarchar(255)
)
CREATE TABLE [stgFilm] (
    [film_id] int,
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
    [address_id] float
)

CREATE TABLE [stgDate] (
    [date key] int,
    [full date] datetime,
    [day of week] int,
    [day num in month] int,
    [day num overall] int,
    [day name] nvarchar(255),
    [day abbrev] nvarchar(255),
    [weekday flag] nvarchar(255),
    [week num in year] int,
    [week num overall] int,
    [week begin date] datetime,
    [week begin date key] int,
    [month] int,
    [month num overall] int,
    [month name] nvarchar(255),
    [month abbrev] nvarchar(255),
    [quarter] int,
    [year] int,
    [yearmo] int,
    [fiscal month] int,
    [fiscal quarter] int,
    [fiscal year] int,
    [month end flag] nvarchar(255),
    [same day year ago] datetime
)
CREATE TABLE [stgInventory] (
    [store_id] int,
    [inventory_id] int,
    [film_id]  int
)
CREATE TABLE [stgRental] (
    [rental_id] int,
    [customer_id] int,
    [staff_id] int,
    [film_id] int,
    [store_id] int,
    [rental_date_key] int,
    [return_date_key] int
)
---------------------------------------------------------
CREATE TABLE [DimAddress] (
    [address_id] int primary key,
    [address] nvarchar(255),
    [city] nvarchar(255),
    [country] nvarchar(255)
)
CREATE TABLE [DimFilm] (
    [film_id] int primary key,
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
    [film_id] int FOREIGN KEY REFERENCES DimFilm(film_id),
    [name] nvarchar(255)
)
CREATE TABLE [DimActor] (
    [film_id] int FOREIGN KEY REFERENCES DimFilm(film_id),
    [fullname] nvarchar(255)
)
CREATE TABLE [DimStore] (
    [store_id] int primary key,
    [staff_id] int,
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id), 
)
CREATE TABLE [DimStaff] (
    [staff_id] int primary key,
    [first_name] nvarchar(255),
    [last_name] nvarchar(255),
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id) ,
    [store_id] int,
    [email] nvarchar(255)
)
CREATE TABLE [DimCustomer] (
    [customer_id] int primary key,
    [first_name] nvarchar(255),
    [last_name] nvarchar(255),
    [email] nvarchar(255),
    [address_id] int FOREIGN KEY REFERENCES DimAddress(address_id)
)

CREATE TABLE [DimDate] (
    [date key] int primary key,
    [full date] datetime,
    [day of week] int,
    [day num in month] int,
    [day num overall] int,
    [day name] nvarchar(255),
    [day abbrev] nvarchar(255),
    [weekday flag] nvarchar(255),
    [week num in year] int,
    [week num overall] int,
    [week begin date] datetime,
    [week begin date key] int,
    [month] int,
    [month num overall] int,
    [month name] nvarchar(255),
    [month abbrev] nvarchar(255),
    [quarter] int,
    [year] int,
    [yearmo] int,
    [fiscal month] int,
    [fiscal quarter] int,
    [fiscal year] int,
    [month end flag] nvarchar(255),
    [same day year ago] datetime
)

CREATE TABLE [FactRental] (
    [rental_id] int primary key,
    [customer_id] int ,
    [staff_id] int,
    [film_id] int,
    [store_id] int,
    [rental_date_key] int,
    [return_date_key] int
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
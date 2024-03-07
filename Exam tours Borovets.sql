create database Around_World
go
use Around_World

--drop database Around_World
GO
create table Employees
(
Id int primary key identity,
[Name] nvarchar(max) not null check([Name]<>''),
Surname nvarchar(max) not null check(Surname<>''),
Position nvarchar(150) not null check(Position<>''),
Phone char(15) not null,
Email nvarchar(50),
HireDate date not null
);
GO
create table Hotels(
Id int primary key identity,
[Name] nvarchar(max) not null check([Name]<>''),
Breakfests int not null check (Breakfests !< 0 and Breakfests <= 1),
HotelsImgLink nvarchar(max)
)
GO
create table Tours (
Id int primary key identity,
[Name] nvarchar(max) not null check([Name]<>''),
Price money not null check( Price> 0),
StartDate date not null,
EndDate date not null,
Transport nvarchar(100) not null,
MaxTourist int not null check(MaxTourist >0),

)
GO
CREATE TABLE Locations (
    Id int primary key identity,
    Country nVARCHAR(50),
    City nVARCHAR(50),
	HotelId int references Hotels(Id)
);
create table Attractions(
Id int primary key identity,
LocationId int references Locations(Id),
[Name] nvarchar(max) not null check([Name]<>''),
ImgURL nvarchar(max)
)
GO
create table ToursAttractions(
Id int primary key identity,
TourId int references Tours(id),
AttractionId int references Attractions(Id),
)
GO
create table TourResponsibilities (
Id int primary key identity,
TourId int references Tours(Id),
EmployeeId int references Employees(Id),
)
GO
create table Customers(
Id int primary key identity,
[Name] nvarchar(max) not null check([Name]<>''),
Surname nvarchar(max) not null check(Surname<>''),
Phone char(15) not null,
Email nvarchar(50),
Birthday date
)
GO
create table TourCustomer(
Id int primary key identity,
TourId int references Tours(Id),
CustomerId int references Customers(Id),
IsPayed int not null check (IsPayed !< 0 and IsPayed <= 1)
)
GO
create table PastTours(
Id int primary key identity,
[Name] nvarchar(max) not null check([Name]<>''),
Price money not null check( Price> 0),
StartDate date not null,
EndDate date not null,
Transport nvarchar(100) not null,
MaxTourist int not null check(MaxTourist >0),
)

INSERT INTO Employees ([Name], Surname, Position, Phone, Email, HireDate)
VALUES 
('John', 'Doe', 'Travel Agent', '123456789', 'john.doe@example.com', '2023-01-01'),
('Jane', 'Smith', 'Tour Guide', '987654321', 'jane.smith@example.com', '2023-02-15'),
('Michael', 'Johnson', 'Tour Manager', '456123789', 'michael.johnson@example.com', '2022-10-10'),
('Emily', 'Williams', 'Travel Consultant', '789456123', 'emily.williams@example.com', '2023-05-20'),
('David', 'Brown', 'Tour Coordinator', '321654987', 'david.brown@example.com', '2022-12-05');

-- Заповнення таблиці Hotels
INSERT INTO Hotels ([Name], Breakfests, HotelsImgLink)
VALUES 
('Hotel A', 1, 'https://example.com/hotel_a.jpg'),
('Hotel B', 0, 'https://example.com/hotel_b.jpg'),
('Hotel C', 1, 'https://example.com/hotel_c.jpg'),
('Hotel D', 1, 'https://example.com/hotel_d.jpg'),
('Hotel E', 0, 'https://example.com/hotel_e.jpg');

-- Заповнення таблиці Tours
INSERT INTO Tours ([Name], Price, StartDate, EndDate, Transport, MaxTourist)
VALUES 
('Tour 1', 1500.00, '2024-02-01', '2024-02-10', 'Bus', 20),
('Tour 2', 2000.00, '2024-03-07', '2024-03-11', 'Train', 15),
('Tour 3', 1800.00, '2024-07-10', '2024-07-20', 'Airplane', 25),
('Tour 4', 2200.00, '2024-08-05', '2024-08-15', 'Boat', 18),
('Tour 5', 1900.00, '2024-09-20', '2024-09-30', 'Car', 22),
INSERT INTO Tours ([Name], Price, StartDate, EndDate, Transport, MaxTourist)
VALUES
('Tour 7', 2000.00, '2024-03-02', '2024-03-25', 'Train', 15);


-- Заповнення таблиці Locations
INSERT INTO Locations (Country, City, HotelId)
VALUES 
('France', 'Paris', 1),
('Italy', 'Rome', 2),
('Spain', 'Barcelona', 3),
('Japan', 'Tokyo', 4),
('Australia', 'Sydney', 5);
select * from Locations
-- Заповнення таблиці Attractions
INSERT INTO Attractions (LocationId, [Name], ImgURL)
VALUES 
(6, 'Eiffel Tower', 'https://example.com/eiffel_tower.jpg'),
(2, 'Colosseum', 'https://example.com/colosseum.jpg'),
(3, 'Sagrada Familia', 'https://example.com/sagrada_familia.jpg'),
(4, 'Tokyo Tower', 'https://example.com/tokyo_tower.jpg'),
(5, 'Sydney Opera House', 'https://example.com/sydney_opera_house.jpg');
INSERT INTO Attractions (LocationId, [Name], ImgURL)
VALUES 
(6, 'Eiffel1 Tower', 'https://example.com/eiffel_tower.jpg');

-- Заповнення таблиці ToursAttractions
INSERT INTO ToursAttractions (TourId, AttractionId)
VALUES 
(1, 1),
(1, 2),
(2, 4),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO ToursAttractions (TourId, AttractionId)
VALUES
(1, 2);

-- Заповнення таблиці TourResponsibilities
INSERT INTO TourResponsibilities (TourId, EmployeeId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO TourResponsibilities (TourId, EmployeeId)
VALUES 
(6, 5),
(7, 5);

-- Заповнення таблиці Customers
INSERT INTO Customers ([Name], Surname, Phone, Email, Birthday)
VALUES 
('Alice', 'Johnson', '987654321', 'alice.johnson@example.com', '1990-03-15'),
('Bob', 'Smith', '123456789', 'bob.smith@example.com', '1985-07-20'),
('Charlie', 'Brown', '789456123', 'charlie.brown@example.com', '1978-11-10'),
('Diana', 'Williams', '456123789', 'diana.williams@example.com', '1995-05-25'),
('Eleanor', 'Davis', '321654987', 'eleanor.davis@example.com', '1980-09-05');
INSERT INTO Customers ([Name], Surname, Phone, Email, Birthday)
VALUES 
('Bob', 'Marley', '321654987', 'eleanor.davis@example.com', '1980-09-05');

-- Заповнення таблиці TourCustomer
INSERT INTO TourCustomer (TourId, CustomerId, IsPayed)
VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1);
INSERT INTO TourCustomer (TourId, CustomerId, IsPayed)
VALUES 
(6, 2, 1),
(6, 5, 1);
INSERT INTO TourCustomer (TourId, CustomerId, IsPayed)
VALUES 
(1, 2, 1),
(2, 3, 1);
-----------------------------------------1
create or alter View ActiveToursView AS
SELECT 
    t.Id as TourID,
    t.[Name] as TourName,
    t.Price,
    t.StartDate,
    t.EndDate,
    t.Transport,
    t.MaxTourist,
    e.[Name] + ' ' + e.Surname as ResponsibleEmployee
from 
    Tours t
	join TourResponsibilities tr on tr.TourId = t.Id
	join Employees e  on tr.EmployeeId = e.Id
where 
    GETDATE() BETWEEN t.StartDate AND t.EndDate;
	--
select * from ActiveToursView
--------------------------2
create or alter procedure GetToursByDateRange
    @StartDate date,
    @EndDate date
as
BEGIN
    select t.Id as TourID, t.[Name] as TourName, t.Price, t.StartDate, t.EndDate, t.Transport, t.MaxTourist, e.[Name] + ' ' + e.Surname as ResponsibleEmployee
    from 
        Tours t
    join TourResponsibilities tr on tr.TourId = t.Id
	join Employees e  on tr.EmployeeId = e.Id
    where 
        t.StartDate between @StartDate and @EndDate;
END;

exec GetToursByDateRange '2024-05-01', '2024-06-30';
-----------------------------------3
create or alter procedure GetToursByCountry
    @Country nvarchar(50)
as
BEGIN
    select 
        t.Id as TourID,
        t.[Name] as TourName,
        t.Price,
        t.StartDate,
        t.EndDate,
        t.Transport,
        t.MaxTourist,
        e.[Name] + ' ' + e.Surname as ResponsibleEmployee
		 
    from 
        Tours t
    join TourResponsibilities tr on tr.TourId = t.Id
	join Employees e  on tr.EmployeeId = e.Id
	join ToursAttractions ta on ta.TourId = t.Id
    join Attractions a on ta.AttractionId = a.Id
	join Locations l on a.LocationId = l.Id
    where 
        l.Country = @Country;
END;
exec GetToursByCountry 'France';
--------------------------------------------4

create or alter View TopCountry as
select TOP 1 l.Country, COUNT(t.Id) as ToursCount
from Tours t
	join ToursAttractions ta on ta.TourId = t.Id
    join Attractions a on ta.AttractionId = a.Id
	join Locations l on a.LocationId = l.Id
	group by l.Country
	order by ToursCount DESC;

select *  from TopCountry
---------------------5
create or alter View TopTour as
select TOP 1 t.Id, t.[Name] as TourName, COUNT(tc.Id) as TicketsSold
from Tours t
join TourCustomer tc ON t.Id = tc.TourId
where t.EndDate >= GETDATE()
group by t.Id, t.[Name]
order by TicketsSold DESC;

select *  from TopTour
------------------------------6
create or alter View TopPastTour as
select TOP 1 pt.Id as PastTourId, pt.[Name] as PastTourName, COUNT(tc.TourId) as TouristCount
from PastTours pt
join TourCustomer tc on pt.Id = tc.TourId
group by pt.Id, pt.[Name]
order by TouristCount DESC;

select * from TopPastTour
------------------------------7
create or alter View WorstTour as
select TOP 1 t.Id, t.[Name] as TourName, COUNT(tc.Id) as TicketsSold
from Tours t
left join TourCustomer tc on t.Id = tc.TourId
WHERE t.EndDate >= GETDATE()
group by t.Id, t.[Name]
order by TicketsSold;

select *  from WorstTour
----------------------------------8
create or alter procedure GetToursByCustomerName
    @CustomerFullName nvarchar(100)
AS
BEGIN
    select t.Id, t.[Name] as TourName, t.StartDate, t.EndDate
    from Tours t
    JOIN TourCustomer tc on t.Id = tc.TourId
    JOIN Customers c on tc.CustomerId = c.Id
    where CONCAT(c.[Name], ' ', c.Surname) = @CustomerFullName;
END;
exec GetToursByCustomerName 'Bob Smith';
---------------------------9
create or alter procedure check_customer_in_tour
    @customer_full_name nvarchar(100)
as
BEGIN
    declare @is_in_tour bit;

    set @is_in_tour = (
        select case when EXISTS (
            select 1
            from TourCustomer tc
            join Customers c on tc.CustomerId = c.Id
            join Tours t on tc.TourId = t.Id
            WHERE CONCAT(c.[Name], ' ', c.Surname) = @customer_full_name
                and t.StartDate <= GETDATE()
                and t.EndDate >= GETDATE()
        ) then 1 else 0 END
    );

    select @is_in_tour as IsInTour;
END;
exec check_customer_in_tour 'Bob Smith';
-----------------------------10

create or alter procedure show_customer_location
    @customer_full_name nvarchar(100)
AS
BEGIN
    if NOT EXISTS (
        select 1
        from TourCustomer tc
        join Customers c on tc.CustomerId = c.Id
        where CONCAT(c.[Name], ' ', c.Surname) = @customer_full_name
    )
    BEGIN
        throw 51000, 'TOurist isnt in any tour.', 1;
    END;

    select t.[Name] as TourName, l.Country, l.City
    from TourCustomer tc
    join Customers c on tc.CustomerId = c.Id
    join Tours t on tc.TourId = t.Id
    join ToursAttractions ta on ta.TourId = t.Id
    join Attractions a on ta.AttractionId = a.Id
	join Locations l on a.LocationId = l.Id
    where CONCAT(c.[Name], ' ', c.Surname) = @customer_full_name;
END;

exec show_customer_location 'Bob Marley';
-------------------------11
create or alter View TopCustomer as
select TOP 1 c.Id as CustomerId, CONCAT(c.[Name], ' ', c.Surname) as CustomerName, COUNT(tc.CustomerId) as PurchasedToursCount
from TourCustomer tc
join Customers c on tc.CustomerId = c.Id
group by c.Id, c.[Name], c.Surname
order by PurchasedToursCount DESC;

select * from TopCustomer
---------------------------12
create or alter procedure show_tours_by_transport
    @transport_type nvarchar(100)
as
BEGIN
    select t.Id, t.[Name] as TourName, t.Price, t.StartDate, t.EndDate, t.Transport, t.MaxTourist
    from Tours t
    where t.Transport = @transport_type;
END;

exec show_tours_by_transport 'Train';
-------------------------------13
create or alter procedure insert_customer
    @customer_name nvarchar(max),
    @customer_surname nvarchar(max),
    @phone char(15),
    @email nvarchar(50),
    @birthday date
as
BEGIN
    if exists (
        select 1
        from Customers
        where [Name] = @customer_name AND Surname = @customer_surname
    )
    BEGIN
        throw 50001, 'Customer already exist.', 1;
    END
    else
    BEGIN
        insert into Customers ([Name], Surname, Phone, Email, Birthday)
        values (@customer_name, @customer_surname, @phone, @email, @birthday);
    END
END;
exec insert_customer 'Bob', 'Smith', '123456789', 'bob.smith@example.com', '1985-07-20';
exec insert_customer 'NeBob', 'NeSmith', '123456789', 'bob.smith@example.com', '1985-07-20';
--------------------------14
create or alter trigger trg_MoveTourToPastTours
on Tours
after delete
as
BEGIN
    insert into PastTours ([Name], Price, StartDate, EndDate, Transport, MaxTourist)
    select [Name], Price, StartDate, EndDate, Transport, MaxTourist
    from deleted;
END;

insert into Tours ([Name], Price, StartDate, EndDate, Transport, MaxTourist)
values 
    ('Tour 8', 100.00, '2024-03-01', '2024-03-05', 'Bus', 20);
	select * from Tours
	select * from PastTours
delete from Tours where Id = 8
----------------------------15
create or alter view ToHotel as
select TOP 1 h.Id as HotelId, h.[Name] as HotelName, COUNT(tc.CustomerId) as TouristCount
from TourCustomer tc
	join Tours t on tc.TourId = t.Id
	join ToursAttractions ta on ta.TourId = t.Id
    join Attractions a on ta.AttractionId = a.Id
	join Locations l on a.LocationId = l.Id
	join Hotels h on l.HotelId = h.Id
group by h.Id, h.[Name]
order by TouristCount DESC;

select* from ToHotel
-----------------------------16
create or alter procedure insert_tourist_to_tour
    @tour_id int,
    @customer_id int
as
BEGIN
    declare @current_tourist_count int;
    declare @max_tourist_count int;

    select @current_tourist_count = COUNT(*)
    from TourCustomer
    where TourId = @tour_id;

    select @max_tourist_count = MaxTourist
    from Tours
    where Id = @tour_id;


    if @current_tourist_count >= @max_tourist_count
    BEGIN
        throw 50002, 'Max quantity of customers int tour reached.', 1;
    END
    else
    BEGIN

        insert into TourCustomer (TourId, CustomerId, IsPayed)
        values (@tour_id, @customer_id, 0);
    END
END;

exec insert_tourist_to_tour 1, 2;

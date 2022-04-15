CREATE DATABASE Pizza
USE Pizza
CREATE TABLE Pizzas
(
ID int primary key identity,
[Name] nvarchar (50) not null,
Price float,
Size int
)
CREATE TABLE Settings(
ID int primary key identity,
[Key] nvarchar(50) not null,
[Value] nvarchar (50) not null
)
CREATE TABLE Sliders(
ID int primary key identity,
[Image] nvarchar (50) not null
)
CREATE TABLE DeletedSliders(
ID int primary key identity,
SlideID int references Sliders(ID)
)
CREATE TABLE Buttons(
ID int primary key identity,
PizzaID int references Pizzas(ID)
)
--DROP DATABASE Pizzas
CREATE TRIGGER ReturnPizzaDelete
on Sliders
AFTER DELETE
AS
BEGIN 
SELECT*FROM DeletedSliders
END

CREATE VIEW v_getDeletedSliders AS
SELECT Sliders
FROM DeletedSliders
create table Customers(
CustomerID int primary key identity,
FirstName varchar(100),
LastName varchar(100),
Email varchar(max),
Phone bigint,
Address varchar(300)
)


create table Products(
ProductID int primary key identity,
ProductName varchar(100),
Description varchar(300),
Price int)

alter table Products
alter column Price money

create table Orders(
OrderID int primary key identity,
CustomerID int,
Orderdate date,
TotalAmount money,
constraint fk_CID foreign key (CustomerID) references Customers(CustomerID))




create table OrderDetails(
OrderDetailsID int primary key identity,
OrderID int,
ProductID int,
Quantity float,
constraint fk_OID foreign key(OrderID) references Orders(OrderID),
constraint fk_PID foreign key(ProductID) references Products(ProductID))

create table Inventory(
InventoryID int primary key identity,
ProductID int,
Quantityinstack float,
LastStockUpdate date,
constraint fk_IPID foreign key(ProductID) references Products(ProductID))

insert into Customers (FirstName,LastName,Email,Phone,Address) values
('Ram','Kumar','ramkumar@gmail.com',7567889067,'12, ab street')

insert into Customers (FirstName,LastName,Email,Phone,Address) values
('Raj','Kumar','rajkumar@gmail.com',8765412345,'10, xy street'),
('Ramesh','Kannan','rameshkannan@gmail.com',9384412345,'19, cd street'),
('Ganesh','Kumar','ganeshkumar@gmail.com',8768472545,'110, xyzl street'),
('Abishek','Krishna','AbishekKrishna@gmail.com',8796412345,'101, cady street'),
('Senthil','Kumar','Senthilkumar@gmail.com',9786412345,'109, anms street'),
('John','Peter','johnpeter@gmail.com',6746419375,'213, jqt street'),
('Afsar','Mohmmed','afsarmohmmed@gmail.com',9067412345,'190, ikb street'),
('Aakash','Ram','aakashram@gmail.com',9125418375,'315, rch street'),
('Irai','Anbu','iraianbu@gmail.com',8473957649,'928, gma street')

select * from Customers

insert into Products (ProductName,Description, Price) values
('Monitor','1080Px 120hz','9500'),
('Keyboard','Mechanical Keys with RGB','3000'),
('Mouse','8000 DPI with RGB','1200'),
('CPU cabin','White color','2500'),
('Processor','I7, 12th generation','13000'),
('Ram','16GB','6000'),
('Graphics card','3060ti 6GB','16000'),
('Cooler','Dual fan','1550'),
('SMPS','Gold rated','9750'),
('SSD','2TB','8000'),
('Harddisk','3TB','7550')

insert into Orders (CustomerID,Orderdate, TotalAmount) values
(1,'2025-01-05',6000), --ram
(2,'2025-01-19',4200), --keyboard,mouse
(3,'2025-01-27',17050), --monitor,harddisk
(4,'2025-02-04',11300), --cooler,smps
(5,'2025-02-15',29000), --processor,graphics card
(6,'2025-02-19',15500), --cpu cabin, processor
(7,'2025-02-02',23300), --ram, smps, harddisk
(8,'2025-03-08',15500), --ssd, harddisk
(9,'2025-03-11',14000), --monitor
(10,'2025-03-16',21800) --cpu cabin, cooler, smps, ssd

insert into OrderDetails (OrderID,ProductID,Quantity) values 
(1,6,1),
(2,2,1),(2,3,1),
(3,1,1),(3,11,1),
(4,8,1),(4,9,1),
(5,5,1),(5,7,1),
(6,4,1),(6,5,1),
(7,6,1),(7,9,1),(7,11,1),
(8,10,1),(8,11,1),
(9,1,1),
(10,4,1),(10,8,1),(10,9,1),(10,10,1)

insert into Inventory (ProductID, Quantityinstack, LastStockUpdate) values
(1,8,'2025-02-04'),
(2,15,'2025-03-06'),
(3,22,'2025-03-10'),
(4,7,'2025-02-19'),
(5,10,'2025-03-12'),
(6,12,'2025-02-21'),
(7,8,'2025-02-26'),
(8,16,'2025-03-02'),
(9,19,'2025-03-15'),
(10,21,'2025-02-22')

select * from Customers
select * from Products
select * from Orders
select * from OrderDetails
select * from Inventory

select FirstName, LastName, Email from Customers --1

SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID; --2

insert into Customers (FirstName,LastName, Email) values ('Ravi','Varma','ravivarma@gmail.com') --3

update Products
set Price=(0.10*Price)+Price --4

delete from OrderDetails where OrderID=4
delete from Orders where OrderID=4 --5

insert into Orders (CustomerID, Orderdate, TotalAmount) values
(11,'2023-03-15',3300) --6

update Customers 
set Email='rajk@gmail.com', Address= '556, byt street' where CustomerID=1 --7

--8

delete from OrderDetails where OrderID=3
delete from Orders where OrderID=3 --9

insert into Products (ProductName,Description,Price) values ('Laptop', '1tb ssd,8gb ram', 55000) --10

--11

--12


Select c.FirstName, c.LastName, count(o.OrderID) as No_of_orders
from Customers c
Left Join 
Orders O on c.CustomerID = o.CustomerID
Group by c.CustomerID,c.FirstName,c.LastName

Select c.FirstName, c.LastName, count(od.OrderDetailsID) as No_of_orders
from Customers c
Left Join 
Orders o on c.CustomerID = o.CustomerID
Left Join
OrderDetails od on o.OrderID=od.OrderID
Group by c.CustomerID,c.FirstName,c.LastName




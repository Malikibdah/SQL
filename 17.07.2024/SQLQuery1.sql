create database library_System;

create table Books 
(
ID int primary key IDENTITY(1,1),
BookName varchar(30),
Printing_Year int,
SectionID int,-- Foreign key
UserID int,-- Foreign key
foreign key (SectionID) references Sections (ID) ON DELETE CASCADE,
foreign key (UserID) references Users (ID) ON DELETE CASCADE
);

insert into Books values
('To Kill a Mockingbird',1880,1,2),
('George Orwell',1999,1,2),
('Pride and Prejudice',2001,4,5),
('The Great Gatsby',1996,3,5),
('The Catcher in the Rye',2000,4,1),
('Moby-Dick',2008,1,2),
('War and Peace',2015,2,3),
('One Hundred Years of Solitude',2020,5,3);

create table Authors  
(
ID int primary key IDENTITY(1,1),
AuthorName varchar(30),
NumberOfBooks int
);

insert into Authors values
('Ayman',5),
('Dana',15),
('Faisal',20),
('Batool',96),
('Ahmad',42);

create table Authors_Books  
(
BookID int ,-- Foreign key
AuthorID int,-- Foreign key
foreign key (BookID) references Books (ID) ON DELETE CASCADE,
foreign key (AuthorID) references Authors (ID) ON DELETE CASCADE
);

insert into Authors_Books values
(1,2),
(1,3),
(4,5),
(3,1),
(4,1),
(1,5),
(6,1),
(7,4),
(4,1),
(1,2),
(8,3),
(5,3);

create table Categories    
(
ID int primary key IDENTITY(1,1),
CategorieName varchar(30),
);

insert into Categories values
('History'),
('Science'),
('Philosophy'),
('Religion'),
('Law'),
('Economics'),
('Romance'),
('Fantasy'),
('Literature');


create table Books_Categories    
(
CatagorieID int ,-- Foreign key
BookID int ,-- Foreign key
foreign key (CatagorieID) references Categories (ID) ON DELETE CASCADE,
foreign key (BookID) references Books (ID) ON DELETE CASCADE
);

insert into Books_Categories values
(1,2),
(1,3),
(4,5),
(3,1),
(4,1),
(1,5),
(6,8),
(7,4),
(4,1),
(1,2),
(8,3),
(5,3);

create table Sections   
(
ID int primary key IDENTITY(1,1),
SectionName varchar(30),
);

insert into Sections values
('A'),
('B'),
('C'),
('D'),
('E');

create table Employees    
(
ID int primary key IDENTITY(1,1),
EmployeeName varchar(30),
Year_of_Employment int ,
SectionID int ,
foreign key (SectionID) references Sections (ID) ON DELETE CASCADE
);

insert into Employees values
('Ayman',2020,2),
('Donia',2015,1),
('Haneen',2023,3),
('Hussen',2010,3),
('Abdullah',2017,4);

create table Users    
(
ID int primary key IDENTITY(1,1),
UserName varchar(30),
Email varchar(30)
);

insert into Users values
('Malik','malikibdah@gmail.com'),
('Ali','Ali@gmail.com'),
('Hasan','Hasan@gmail.com'),
('Ameer','Ameer@gmail.com'),
('Hazem','Hazem@gmail.com');

select * from Books;
select * from Authors;
select * from Categories;
select * from Users;
select * from Books_Categories;
select * from Authors_Books;
select * from Sections;
select * from Employees;

SELECT BookName, SectionID, UserName
FROM Books
INNER JOIN Users ON Books.UserID = Users.ID;

SELECT BookName, AuthorName
FROM Books
left JOIN Authors ON Books.UserID = Authors.ID;

SELECT BookName, AuthorName
FROM Books
right JOIN Authors ON Books.UserID = Authors.ID;

SELECT BookName, CategorieName
FROM Books
left JOIN Categories ON Books.UserID = Categories.ID;

SELECT BookName, CategorieName
FROM Books
right JOIN Categories ON Books.UserID = Categories.ID;

SELECT BookName, CategorieName
FROM Books
full JOIN Categories ON Books.UserID = Categories.ID;
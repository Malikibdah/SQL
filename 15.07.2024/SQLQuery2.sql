create database Library;

create table Books
(
BookID int,Title varchar(30)
,AuthorID int,PublishedYear int
,CopiesAvailable varchar(30)
,BookCategory varchar(30)
);

create table Authors
(
AuthorID int,FirstName varchar(30)
,LastName varchar(30)
,BirthYear int
);

insert into Books 
values (2,'serah',1,1400,'yes','Relegen');

insert into Authors 
values (9,'Malik','Ibdah',1994);

--select * from Books,Authors;

select * from Books;

select * from Authors;

select min(CopiesAvailable) from Books;
select max(CopiesAvailable) from Books;

select CopiesAvailable from Books
where CopiesAvailable = 'yes';

select avg(PublishedYear)
from Books;

select count(BookID)
from Books;

truncate table Books;

drop table Authors;
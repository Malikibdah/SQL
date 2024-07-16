create database SchoolSystem;

create table Teachers 
(
TeacherID int Primary key,
FirstName varchar(30),
LastName varchar(30)
);

insert into Teachers values 
(1,'Malik','Ibdah'),
(2,'Mohamed','Fawaareh'),
(3,'Yousef','Khriwesh'),
(4,'Qusia','Senjalwi'),
(5,'Mustafa','Almomani')
;

create table TeacherDetails
(
ID int Unique,
Email varchar (30),
PhoneNumber int,
Adress varchar(30),
Foreign key (ID) References Teachers (TeacherID)
);

insert into TeacherDetails values 
(1,'aaaa@gmail.com',0785484,'Irbid'),
(2,'aaaa@gmail.com',0785484,'Irbid'),
(3,'aaaa@gmail.com',0785484,'Irbid'),
(4,'aaaa@gmail.com',0785484,'Irbid'),
(5,'aaaa@gmail.com',0785484,'Irbid');


create table Courses
(
CourseID int Primary Key,
CourseName varchar(30),
TeacherId int ,
Foreign key (TeacherId) References Teachers (TeacherID)
);

insert into Courses values 
(1,'C++',1),
(2,'C#',2),
(3,'Java',3),
(4,'Python',4),
(5,'MVc',5);


create table Student
(
StudentID int Primary key,
StudentName varchar(30)
);
insert into Student values
(1,'anas'), 
(2,'Ali'), 
(3,'Ayam'), 
(4,'Ayman'), 
(5,'Amer');


create table Student_Courses
(
CourseID int ,
StudentID int ,
Foreign Key (CourseID) References Courses (CourseID),
Foreign Key (StudentID) References Student (StudentID),
Primary Key (CourseID , StudentID)
);
 insert into Student_Courses values
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5);



select * from Courses;
select * from Student;
select * from Teachers;
select * from TeacherDetails;
select * from Student_Courses;
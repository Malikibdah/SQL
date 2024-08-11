create database  School_Management_System;
--one to many relation with Family info
--one to many relation with Classes
create table Students
(
ID int primary key identity(1,1) ,
student_name varchar(30),
date_of_birth varchar(30),
Student_Address varchar(30),
Father_id int ,
Classes_id int ,
foreign key (Father_id) references Family_info (ID) ON DELETE CASCADE,
foreign key (Classes_id) references Classes (ID) ON DELETE CASCADE,
)

create table Family_info
(
ID int primary key identity(1,1) ,
Father_name varchar(30),
Father_number int 
)

create table Courses
(
ID int primary key identity(1,1) ,
Course_name varchar(30),
Course_Description varchar(255),
Resources varchar(30)
)

create table Classes
(
ID int primary key identity(1,1),
Class_Code varchar(30),
Room_number int ,
Schedule varchar(30)
)

create table Assignments
(
ID int primary key identity(1,1),
Assignment_name varchar(30),
Assignment_description varchar(255),
Due_date varchar(30),
States varchar(30)
)
--one to many relation with Students
create table Attendance
(
ID int primary key identity(1,1),
Attendance_date varchar(30),
Type_of_absence varchar(30),
Student_ID int ,
foreign key (Student_ID) references Students (ID) ON DELETE CASCADE
)
--many to many relation between Students and Assignments
create table Students_Assignments
(
ID int primary key identity(1,1),
Student_ID int ,
Assignment_ID int ,
foreign key (Student_ID) references Students (ID) ON DELETE CASCADE,
foreign key (Assignment_ID) references Assignments (ID) ON DELETE CASCADE
)
--many to many relation Students and Courses
create table Students_Courses
(
ID int  primary key identity(1,1), 
Student_ID int ,
Courses_ID int ,
foreign key (Student_ID) references Students (ID) ON DELETE CASCADE,
foreign key (Courses_ID) references Courses (ID) ON DELETE CASCADE
)

select * from Family_info;
select * from Classes;
select * from Courses;
select * from Assignments;
select * from Attendance;
select * from Students;
select * from Students_Assignments;
select * from Students_Courses;

--1- Select students in a specific Date date ?
select * from Students where date_of_birth = '23/12/1994';

--2- Select details of a course by its name ? 
select * from Courses where Course_name = 'c#';

-- add new column for Students table with data type varchar(30)
--3-Add a new column 'Email' to the Students table ?
Alter table Students 
add Email varchar(30);

update Courses 
set Resources = 'CSS coding' 
where Course_name = 'css';

--4- Insert a new student record ?
insert into Students (student_name,date_of_birth,Student_Address,Father_id,Classes_id)
values('Sultan','22/8/1999','Irbid',4,3);

--6- Select students who are enrolled in a specific course (e.g : Math) ? 
select * from Students_Courses where Courses_ID = 1;

--7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 
select Students.student_name
from Students 
join Students_Assignments on Students.ID= Students_Assignments.Student_ID
join Assignments on Students_Assignments.Assignment_ID = Assignments.ID
where Assignments.States='pass';

--8- i need the student who tooke an leaving between last sunday and the Thursday ? 
--(e.g: between this date : 1/1/2024 - 5/1/2024 )

select Students.student_name 
from Students 
join Attendance on Students.ID = Attendance.Student_ID
where Attendance.Attendance_date >='11/8/2024' 
and  Attendance.Attendance_date <= '15/8/2024'
and Attendance.Type_of_absence = 'leaving';

--9- i need the names of students who have absence mre than 4 ? ( not late of leaving )
select Students.student_name 
from Students 
join Attendance on Students.ID = Attendance.Student_ID
where Attendance.Type_of_absence = 'absence'
GROUP BY Students.student_name
HAVING COUNT(Attendance.Type_of_absence) > 4;
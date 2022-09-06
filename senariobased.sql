CREATE DATABASE TASK3
USE TASK3
--question1
CREATE TABLE books (ID INT PRIMARY KEY ,TITLE VARCHAR(30),AUTHOR VARCHAR(40),ISBN VARCHAR(40),PUBLISHED_DATE DATE)
insert into books values(1,'My First SQL Book','Mary Parker',981483029127,'2012-02-22 12:08:17')
insert into books values(2,'My Second SQL Book','John Mayer',857300923713 ,'1972-07-03 09:22:45')
insert into books values(3,'My Third SQL Book','Cary Flint ',523120967812 ,'2015-10-18 14:05:44')
--Write a query to fetch the details of the books written by author whose name ends with er.
select * from books where author like '%er'


--QUESTION2
create table reviews(id int foreign key references books(id),book_id int ,reviewer_name varchar(30),content varchar(30), rating int,publised_date datetime)
insert into reviews values(1,1,'John Smith','My First Review',4,'2017-12-10 05:50:11')
insert into reviews values((2,2,'John Smith','My Second Review',5,'2017-10-13 15:50:12')
insert into reviews values((3,2,'Alice Walker','Another Review',1,'2017-10-22 23:47:10')

--Display the Title ,Author and ReviewerName for all the books from the above table

select title,author,reviewer_name from books,reviews where books.id=reviews.id

--Display the reviewer name who reviewed more than one book

select reviewer_name from (select reviewer_name from reviews group by reviewer_name having count(reviewer_name) > 1) reviews

--question4
create table CUSTOMERS(ID int primary key,NAME varchar(20),AGE int,ADDRESS varchar(20),SALARY float)
insert into CUSTOMERS values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00)
insert into CUSTOMERS values(3,'Kaushik',23,'Kota',2000.00),(4,'Chaitali',25,'Mumbai',6500.00)
insert into CUSTOMERS values(5,'Hardik',27,'Bhopal',8500.00),(6,'Komal',22,'MP',4500.00)
insert into CUSTOMERS values(7,'Muffy',24,'Indore',10000.00)

--Display the Name for the customer from above customer table who live in same address which has character o anywhere in address

select NAME from CUSTOMERS where ADDRESS like '%o%'


--question5
create table ORDERS(OID int,DATE datetime,CUSTOMER_ID int references CUSTOMERS(ID),AMOUNT int)
insert into ORDERS values(102,'2009-10-08 00:00:00',3,3000)
insert into ORDERS values(100,'2009-10-08 00:00:00',3,1500)
insert into ORDERS values(101,'2009-11-20 00:00:00',2,1560)
insert into ORDERS values(103,'2008-05-20 00:00:00',4,2060)
--Write a query to display the Date,Total no of customer placed order on same Date
select date,ROW_NUMBER() over (partition by date order by id) as order_placed from CUSTOMERS c left join ORDERS o on c.id =o.CUSTOMER_ID




--question6
create table Employee(ID int primary key,NAME varchar(20),AGE int,ADDRESS varchar(20),SALARY float)
insert into Employee values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),(6,'Komal',22,'MP',null),(7,'Muffy',24,'Indore',null)

--Display the Names of the Employee in lower case, whose salary is null
select lower(NAME) from Employee where SALARY is null;


--QUESTION7
CREATE TABLE STUDENTDETAILS(REGISTERNO INT PRIMARY KEY,NAME VARCHAR(20),AGE INT, qUALIFICATION VARCHAR(15),mOBILENO VARCHAR(30),MAIL_ID VARCHAR(40),LOCATION VARCHAR(30),GENDER VARCHAR)
INSERT INTO STUDENTDETAILS VALUES(2,'SAI',22,'B.E','9952836777','sai@gmail.com','CHENNAI','M')
INSERT INTO STUDENTDETAILS VALUES(3,'KUMAR',20,'BSC','7890125648','kumar@gmail.com','MADURAI','M')
INSERT INTO STUDENTDETAILS VALUES(4,'SELVI',22,'B.TECH','89045567342','selvi@gmail.com','SELAM','F')
INSERT INTO STUDENTDETAILS VALUES(5,'NEHA',25,'M.E','7834672310','nisha@gmail.com','THENI','F')
INSERT INTO STUDENTDETAILS VALUES(6,'SAI SARAN',21,'B.A','7890345678','saran@gmail.com','MADURAI','F')
INSERT INTO STUDENTDETAILS VALUES(7,'TOM',23,'BCA','8901234675','tom@gmail.com','PUNE','M')

--Write a sql server query to display the Gender,Total no of male and female from the above
select gender,count(gender) from STUDENTDETAILS
group by gender
order by gender desc
--Display all the student name in reverse order and Capitalize all the character in location
SELECT UPPER(LOCATION),REVERSE(NAME) FROM STUDENTDETAILS


CREATE TABLE COURSEDETAILSS (C_ID VARCHAR(20) PRIMARY KEY,C_NAME VARCHAR(30),START_DATE DATE,END_DATE DATE ,FEE INT)

INSERT INTO COURSEDETAILSS VALUES('DN003','dotnet','2018-02-01','2018-02-28','15000'),
('JA002','AdvancedJava','2018-01-02','2018-01-20','10000'),('JC001','CoreJava','2018-01-02','2018-01-12','3000')

--Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
SELECT C_Name, count(C_id) from COURSEDETAILSS   WHERE Start_Date between  '2018-01-02' and '2018-02-28'  ORDER BY C_id DESC


create table CourseRegistrationn(RegisterNo int references STUDENTDETAILS(REGISTERNO) ,C_id VARCHAR(20) FOREIGN KEY references Coursedetailss(C_ID),Batch varchar(4))
insert into CourseRegistrationn values(2,'DN003','FN')
insert into CourseRegistrationn values(3,'DV004','AN')
insert into CourseRegistrationn values(4,'JA002','FN')
insert into CourseRegistrationn values(2,'JA002','AN')
insert into CourseRegistrationn values(5,'JC001','FN')
select * from CourseRegistrationn

--QUESTION9
create table Customer(customer_id int primary key,first_name varchar(10),last_name varchar(10))
insert into Customer values(1,'George','Washington'),(2,'John','Adams'),(3,'Thomas','Jeffersons'),(4,'James','Madison'),(5,'James','Monroe')
create table order11(order_id int primary key,order_date date,amount varchar(7),customer_id  int FOREIGN KEY references Customer(customer_id) )
insert into order11 values(1,'07/04/1776','$234.56',1),(2,'03/14/1760','$78.50',3),(3,'05/23/1784','$124.00',2),
(4,'09/03/1790','$65.50',3),(5,'07/21/1795','$25.50',10),(6,'11/27/1787','$14.40',9)
--Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
select c_name as 'Course name', (select count(*) 
from CourseRegistrationn where C_id = c.C_ID) 'Number of student registered' from COURSEDETAILSS c where start_date > '2018-01-02' and end_date <= '2018-02-28'

select * from order11
create table ORDER2(ID int primary key,OrderName varchar(10),OrderNumber int,CustomerId int,TotalAmount float)
create table PRODUCT(ID int primary key,ProductName varchar(10),UnitPrice float,Package varchar(10),IsDiscontinued varchar(5))
create table ORDERITEM(ID int primary key,OrderID int references ORDER2(ID),ProductID int references PRODUCT(ID),UnitPrice float,Quanity int)
--Display the Firstname and LastName of the customer who have placed exactly 2 orders.
select * from Customer c where (select count(*) from Order2 where ID = c.customer_id)  = 2

--Create a view table to display the ProductName,ordered Quantity and OrderNumber from the above relations
create view 
orderView as select productname, quanity, ordernumber from ORDER2 o join OrderItem oi on o.id = oi.Id join Product p on oi.id = p.id;

--Display the Course Name registered by student NEHA
select C_Name as 'Course Name of Neha 'from 
(( COURSEDETAILSS d inner join CourseRegistrationn c on d.C_id=c.C_id ) inner join Studentdetails s on s.RegisterNo=c.RegisterNo) where Name='Neha'



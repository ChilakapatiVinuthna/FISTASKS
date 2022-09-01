create database TASK1;
use TASK1;
create table clients(client_id int primary key ,cname varchar(40) not null,address varchar(30),
email varchar(30) unique ,phone varchar(20),business varchar(20) not null)


create table Departments (Deptno int primary key,Dname varchar(15) not null,LOC varchar(20))


create table Employees (Empno int primary key ,Ename varchar(20) not null,Job varchar(15),
Salary int unique check (Salary>0) ,Deptno int references  Departments(Deptno))

create table Projects (Project_ID int primary key,Descr varchar(30) not null,Start_Date Date,Planned_End_Date date,Actual_End_Date date,
Budget int check(Budget>0),Client_ID int  references Clients(client_id))

create table EmpProjectTasks(Project_ID int  references Projects(Project_ID),Empno int  references Employees(Empno),Start_Date DATE,End_Date DATE,
Task VARCHAR(25) Not Null,Status VARCHAR(15) Not Null)

insert into clients(client_id ,cname,address,email,phone ,business ) values(1001,'ACME Utilities','Noida','contact@acmeutil.com','9567880032','Manufacturing')
insert into clients(client_id ,cname,address,email,phone ,business ) values(1002, 'Trackon Consultants' ,'Mumbai', 'consult@trackon.com', '8734210090' ,'Consultant')
insert into clients(client_id ,cname,address,email,phone ,business ) values(1003, 'MoneySaver Distributors', 'Kolkata', 'save@moneysaver.com', '7799886655' ,'Reseller ')
insert into clients(client_id ,cname,address,email,phone ,business ) values(1004, 'Lawful Corp', 'Chennai', 'justice@lawful.com', '9210342219', 'Professional')


insert into Departments values(10, 'Design', 'Pune')
insert into Departments values(20,'Development', 'Pune')
insert into Departments values(30, 'Testing', 'Mumbai')
insert into Departments values(40, 'Document', 'Mumbai')


insert into Employees values(7001,'Sandeep', 'Analyst', 25000, 10)
insert into Employees values(7002,'Rajesh','Designer', 30000, 10)
insert into Employees values(7003, 'Madhav', 'Developer' ,40000 ,20)
insert into Employees values(7004 ,'Manoj' ,'Developer', 40000, 20)
insert into Employees values(7005, 'Abhay', 'Designer' ,35000, 10)
insert into Employees values(7006 ,'Uma' ,'Tester' ,30000 ,30)
insert into Employees values(7007 ,'Gita', 'Tech. Writer', 30000, 40)
insert into Employees values(7008 ,'Priya' ,'Tester', 35000 ,30)
insert into Employees values(7009 ,'Nutan' ,'Developer', 45000, 20)
insert into Employees values(7010 ,'Smita ','Analyst' ,20000 ,10)
insert into Employees values(7011 ,'Anand','Project Mgr', 65000, 10)


insert into Projects values(401,'Inventory', '01-Apr-11', '01-Oct-11', '31-Oct-11', 150000, 1001)
insert into Projects values(402 ,'Accounting', '01-Aug-11',' 01-Jan-12',null, 500000 ,1002)
insert into Projects values(403, 'Payroll', '01-Oct-11',' 31-Dec-11',null, 75000, 1003)
insert into Projects values(404 ,'Contact Mgmt ','01-Nov-11',' 31-Dec-11',null, 50000 ,1004)

insert into EmpProjectTasks values(401, 7001 ,'01-Apr-11 ','20-Apr-11 ','System Analysis',' Completed')
insert into EmpProjectTasks values(401 ,7002 ,'21-Apr-11 ','30-May-11', 'System Design','Completed')
insert into EmpProjectTasks values(401 ,7003 ,'01-Jun-11', '15-Jul-11', 'Coding', 'Completed')
insert into EmpProjectTasks values(401, 7004 ,'18-Jul-11 ','01-Sep-11',' Coding', 'Completed')
insert into EmpProjectTasks values(401, 7006, '03-Sep-11', '15-Sep-11', 'Testing ','Completed')
insert into EmpProjectTasks values(401, 7009, '18-Sep-11','05-Oct-11','Code Change', 'Completed')
insert into EmpProjectTasks values(401, 7008, '06-Oct-11', '16-Oct-11', 'Testing', 'Completed')
insert into EmpProjectTasks values(401, 7007, '06-Oct-11', '22-Oct-11', 'Documentation',' Completed')
insert into EmpProjectTasks values(401, 7011, '22-Oct-11', '31-Oct-11' ,'Sign off', 'Complete')
insert into EmpProjectTasks values(402, 7010, '01-Aug-11', '20-Aug-11', 'System Analysis', 'Completed')
insert into EmpProjectTasks values(402, 7002, '22-Aug-11', '30-Sep-11', 'System Design', 'Completed')
insert into EmpProjectTasks values(402, 7004, '01-Oct-11', null,'Coding', 'In Progress')


select * from Clients
select * from EmpProjectTasks
select * from Departments
select * from Employees
select * from Projects
select * from EmpProjectTasks
sp_help clients
sp_help Employees
sp_help EmpProjectTasks


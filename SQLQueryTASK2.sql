create database TASK22
USE TASK22
create table DEPT(deptno int primary key, dname varchar(30), loc varchar(30))


create table EMP(empno int primary key, ename varchar(50), job varchar(20), mgr_id int, hiredate date, salary int, comm int, deptno int references DEPT(deptno))


insert into DEPT values(10,  'ACCOUNTING ',  'NEW YORK' )
insert into DEPT values(20,   'RESEARCH '  ,   'DALLAS' )
insert into DEPT values(30,    'SALES' , 'CHICAGO' )
insert into DEPT values(40,   ' OPERATIONS',   'BOSTON')


insert into EMP values
(7369 ,'SMITH',        'CLERK',	        7902,    '17-DEC-80',  800, 20,null),
(7499 ,   'ALLEN '  ,  'SALESMAN',		7698  ,  '20-FEB-81',  1600 ,  300 , 30),
(7521 ,   'WARD',	 'SALESMAN ' ,      7698   ,  '22-FEB-81 ' , 1250 ,   500 ,   30),
(7566  ,  'JONES '  ,  'MANAGER' ,      7839 ,    '02-APR-81',  2975   ,   20,null),
(7654  , 'MARTIN'   ,  'SALESMAN' ,     7698  ,   '28-SEP-81',  1250 ,   1400  ,  30),
(7698 ,' BLAKE ',	 'MANAGER' ,	    7839 ,	  '01-MAY-81'  , 2850  ,  30,null),
(7782 ,	  'CLARK ' ,   'MANAGER'  ,     7839 ,    '09-JUN-81',   2450   ,   10,null),
(7788 ,   'SCOTT ' ,   'ANALYST'  ,     7566  ,   '19-APR-87' ,   3000   ,        20,null),
(7839 ,  'KING' ,   'PRESIDENT' ,       null    , '17-NOV-81' ,   5000  ,      10,null),
(7844 ,   'TURNER' ,   'SALESMAN ' ,    7698  ,   '08-SEP-81 ' ,  1500   ,  0,     30),
(7876 ,   'ADAMS'  ,   'CLERK'     ,    7788  ,   '23-MAY-87 ' ,   1100     ,       20,null),
(7900 ,   'JAMES'  ,   'CLERK'   ,      7698  ,   '03-DEC-81'  , 950      ,      30,null),
(7902 ,   'FORD'  ,   'ANALYST'  ,     7566  , 	  '03-DEC-81 '  ,	3000 ,    20,null),
(7934 ,   'MILLER'  ,  'CLERK'  ,       7782  ,   '23-JAN-82',	 1300    ,10,null)




select * from DEPT
select * from EMP
select * from EMP where ename like 'a%'

 --List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
SELECT ename,job,salary
FROM EMP
WHERE salary BETWEEN 1200 AND 1400



--List the employees with the lowest and highest salary.
SELECT MAX(salary) as maxsalary, MIN(salary) as minsalary
FROM EMP;

--Compute yearly salary of SMITH.
SELECT (salary*12) as yearly from EMP where ename like 'SMITH'

--List the name and salary for all employees whose salary is not in the range of 1500 and 2850.
SELECT ename,job,salary
FROM EMP
WHERE salary NOT BETWEEN 1500 AND 1400

-- Find out salary of both MILLER and SMITH.
SELECT salary from emp WHERE ename like 'MILLER' or ename like 'SMITH'
-- Find out the names of the employees whose name begin with ‘A’ or ‘M’
select * from EMP where ename like 'a%' or ename like 'm%'


-- Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 

select ename,salary from EMP where salary >1200 and deptno=20 and job='analyst' order by ename asc
				         

--Select all those employees who don't have a manager. 
select e.ename,e.job from emp e  where mgr_id is null

--List full details of departments that don't have any employees. 
select * from dept where deptno not in(select deptno from emp)


--Find the average salary for each job type and the number of people employed in each job.
select count(*),avg(salary),deptno,job from emp group by deptno,job 

--Find the number of CLERKS employed. Give it a descriptive heading.
 select count(ename) as jobclerk from emp where job like 'clerk'

--For each department, list its name and number together with the total salary paid to employees in that department.
select count(deptno),deptno,ename ,sum(salary) from emp group by deptno
--Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise.

--SET 2







-- Retrieve a list of MANAGERS. 

 select * from EMP where job='MANAGER'

-- Find out the names and salaries of all employees earning more than 1000 per 
--month. 
select ename, salary from EMP where salary > 1000


-- Display the names and salaries of all employees except JAMES. 
select ename, salary from EMP where ename != 'JAMES'



--4. Find out the details of employees whose names begin with ‘S’. 
select * from EMP where ename like 'S%'


--Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from EMP where ename like '%A%'


-- Find out the names of all employees that have ‘L’ as their third character in 
--their name.
select ename from EMP where ename like '___L%'



--7. Compute daily salary of JONES. 
select salary/30 as 'DAILY SALARY OF JONES' from EMP where ename = 'JONES'



--Calculate the total monthly salary of all employees. 
select sum(salary) as 'TOTAL MONTHLY SALARY OF ALL EMPLOYEES' from EMP



-- Print the average annual salary . 
select AVG(salary*12) as 'AVERAGE ANNUAL SALARY' from EMP



-- Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select ename, job, salary, deptno from EMP where job != 'SALESMAN' OR deptno <> 30;



--List unique departments of the EMP table. 
select distinct(e.deptno) as 'DEPARTMENTS',(select dname from DEPT where deptno = e.deptno) 'DEPARTMENT NAME'  from EMP e where deptno is not null;



--List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename 'EMPLOYEE', salary 'MONTLY SALARY'from EMP where salary > 1500 and deptno in (10, 30)



-- Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename , job ,  salary from EMP where job in ('MANAGER', 'ANALYST') AND salary not in 
(1000, 3000, 5000);



--Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select ename, job, comm 'commission' from EMP where comm > (salary + salary * 0.1);



--Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select ename from EMP where ename like '%L%L%' and deptno = 30 or mgr_id = 7782;



-- Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees. 
select ename from EMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20;
select COUNT(empno) from EMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20;



-- Retrieve the names of departments in ascending order and their employees in descending order. 
select ename, dname from EMP e join DEPT d on e.deptno = d.deptno order by dname asc , ename desc;


--Find out experience of MILLER. 
select DATEDIFF(YEAR, hiredate, GETDATE()) 'EXPERIENCE OF MILLER' from EMP where ename='MILLER';

 
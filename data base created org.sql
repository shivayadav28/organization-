drop database if exists org;
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

-----------------------------------------------------------------------------------

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM WORKER;
SELECT * FROM TITLE;
SELECT *FROM BONUS;

#Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
SELECT * FROM WORKER;
select first_name as worker_name from worker limit 1; 
#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) as first_name from worker limit 1; 
#Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct(department) as department from worker;
#Q-4. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.
select left(first_name,3) as first_3_character from worker;
#Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
select position('a' in 'amitabh')from worker; 
select instr(first_name,'a') as postn from worker where first_name='amitabh';
#Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
select rtrim(first_name) as first_name from worker;
#Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
select ltrim(department)as department from worker;
#Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select distinct(department),length(department) as length_department from worker;
#Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘K’. (for replacing char is case-sensitive)
select replace(first_name,'a','K') as replaced_name from worker; 
#Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name,' ',last_name) as full_name from worker;
#Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from worker order by first_name asc;
#Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name desc;
#Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name ='vipul' or first_name = 'satish';
select * from worker where first_name in ('vipul','satish');
#Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from worker where first_name not in ('vipul','satish');
#Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select *,department from worker where department ='admin';
#Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like '%a%';
#Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';
#Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from worker where first_name like '_____H';
#Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select* from worker;
select * from worker where salary between 100000 and 500000;
#Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where joining_date like '2014-02%';
select * from worker where year(joining_date)='2014' and month(joining_date)='02'; 
#Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select department,count(*) as employee_number from worker  where department='admin'group by department ;
#Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select * from worker where salary>=50000 and salary <=100000;
#Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department ,count(*) as  No_Of_Workers_in_Each_Department from worker group by department order by  No_Of_Workers_in_Each_Department;
#Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from worker;
select * from title;
select w.*,t.* from title t inner join worker w on w.worker_id=t.worker_ref_id where worker_title='manager';
#Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select max(first_name) as first_name,salary,count(salary) as no_of_emp  from worker group by salary having count(salary)>1;
select worker_title,count(worker_title)as no_of_worker ,affected_from from title group by worker_title,affected_from having count(worker_title)>1;
#Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker;
select * from worker where mod(worker_id,2)!=0 ;
#Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2)=0;
#Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table worker_clone like worker;
select* from worker_clone;
create table worker_clone_1 select * from worker;
select * from worker_clone_1;
#Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in(select worker_ref_id from bonus);
#Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from worker where worker_id not in(select worker_ref_id from bonus);
#Q-31. Write An SQL Query To Show The Current Date And Time.
select curdate();
select now();
select current_date();
#Q-32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
select * from worker order by salary desc limit 10;
#Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select salary from worker group by salary order by salary desc limit 4,1;
#Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from worker where salary<(select salary from worker group by salary order by salary desc limit 3,1) order by salary desc limit 1;
#Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select salary,count(*)as count_of_salary from worker group by salary having count_of_salary>1;
select * from worker where salary =(select salary from worker group by salary having count(*)>1);
#Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select salary from worker group by salary order by salary desc limit 1,1 ;
#Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select max(salary) from worker where salary not in (select max(salary) from worker);
#Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in(select worker_ref_id  from bonus);
#Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select* from worker;
select * from worker where worker_id<=(select count(*)/2 from worker);
#Q-40. Write An SQL Query To Fetch The Departments That Have Less Than three People In It.
select department,count(*)as number_of_employee from worker group by department having number_of_employee<3;
#Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department,count(*) as number_of_people from worker group by department; 
#Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by worker_id desc limit 1;
#Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker order by worker_id asc limit 1;
#Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from(select*from worker order by worker_id desc limit 5) t order by t.worker_id asc ;
#Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select max(first_name)as first_name ,department,max(salary) as salary from worker group by department order by salary desc;
select * from worker;
#Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select salary  from worker order by salary desc limit 3;
select distinct(salary) as salary from worker order by salary desc limit 3 ;
#Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select salary from worker order by salary asc limit 3;
select distinct(salary) from worker order by salary asc limit 3;
#Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table (say 4th).
select distinct(salary) from worker group by salary order by salary desc limit 3,1;
#Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid.
select department,sum(salary) as total_amount from worker group by department order by department desc ;
#Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary. 
select first_name,last_name ,salary from worker where salary=(select max(salary) from worker);
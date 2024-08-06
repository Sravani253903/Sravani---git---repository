/*Create database Assignment_1*/
use Assignment_1;
use cdb;
CREATE TABLE WorkerAs(
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25));
    
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
        ON DELETE CASCADE);

INSERT INTO Bonus
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
        (001, 5000, '16-02-20'),
        (002, 3000, '16-06-11'),
        (003, 4000, '16-02-20'),
        (001, 4500, '16-02-20'),
        (002, 3500, '16-06-11');
        
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE);
        
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
 
 show tables; 
 
 select UPPER(FIRST_NAME) from worker
 select distinct DEPARTMENT from worker
 select substring(FIRST_NAME, 1, 3) from worker
 select FIRST_NAME from worker where FIRST_NAME like 'A%'
 SELECT DEPARTMENT, LENGTH(DEPARTMENT) AS department_length FROM 
 (SELECT DISTINCT DEPARTMENT
  FROM Worker
) AS unique_departments;

SELECT *FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;
/*Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending*/
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC,DEPARTMENT DESC
/*Write a query to get workers whose name are Vipul and Satish*/
SELECT * FROM WORKER WHERE FIRST_NAME in ( "vipul","satish")

/*Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'*/
SELECT *FROM Worker WHERE FIRST_NAME LIKE '%a%';

/*Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets*/
SELECT *FROM Worker WHERE FIRST_NAME LIKE '_____h' AND CHAR_LENGTH(FIRST_NAME) = 6;

/*Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000*/
SELECT *FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

/*Write an SQL query to print details of the Workers who have joined in Feb’2014*/
SELECT *FROM Worker WHERE JOINING_DATE BETWEEN '2014-02-01' AND '2014-02-28 23:59:59';

/*Write an SQL query to fetch the count of employees working in the department ‘Admin’*/
SELECT COUNT(*) AS NumberOfEmployees FROM Worker WHERE DEPARTMENT = 'Admin';

/*Write an SQL query to fetch the no. of workers for each department in the descending order*/
SELECT DEPARTMENT, COUNT(*) AS NumberOfWorkers
FROM Worker
GROUP BY DEPARTMENT
ORDER BY NumberOfWorkers DESC;

/*Write a query to display workerrs who are managers/*
SELECT *
FROM Worker
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID
    FROM Title
    WHERE WORKER_TITLE = 'Manager');

/*Write query to find duplicate rows title table/*
SELECT WORKER_TITLE, COUNT(*) as count
FROM Title
GROUP BY WORKER_TITLE
HAVING COUNT(*) > 1;


/*Write an SQL query to show all workers who got the bonus along with bonus amount/*
SELECT FIRST_NAME, LAST_NAME, 
       (SELECT BONUS_AMOUNT 
        FROM Bonus 
        WHERE WORKER_REF_ID = Worker.WORKER_ID
        LIMIT 1) AS BONUS_AMOUNT
FROM Worker
WHERE WORKER_ID IN (
    SELECT WORKER_REF_ID
    FROM Bonus
);


/*Write a query to find employees in worker table that do not exist in bonus table (ie did not get bonus)/*
SELECT *
FROM Worker
WHERE WORKER_ID NOT IN (
    SELECT WORKER_REF_ID
    FROM Bonus
);

/*Write a query to find the highest 2 salaries/*
SELECT DISTINCT SALARY
FROM Worker
ORDER BY SALARY DESC
LIMIT 2;

/*Find 2nd highest without using TOP or LIMIT/*
SELECT MAX(SALARY) AS SecondHighestSalary
FROM Worker
WHERE SALARY NOT IN (
    SELECT MAX(SALARY)
    FROM Worker
);

/*Find people who have the same salary/*
SELECT *
FROM Worker
WHERE SALARY IN (
    SELECT SALARY
    FROM Worker
    GROUP BY SALARY
    HAVING COUNT(*) > 1
);

/*Write a query to fetch 1st 50% records without using Top/*
SELECT e.*
FROM Worker e
WHERE WORKER_ID <= (
  SELECT COUNT(*) / 2
  FROM Worker
);

/*Write a query to select a department with more than 3 people in worker table/*
SELECT DEPARTMENT
FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) > 3;


/*Write a query to select 1st and last row of a worker tab/*
SELECT * FROM worker WHERE WORKER_ID IN ((SELECT MIN(WORKER_ID) FROM worker), (SELECT MAX(WORKER_ID) FROM worker));

/*Write a query to select last 5 entries from worker table/*
SELECT *FROM worker
ORDER BY WORKER_ID DESC
LIMIT 5;

/*Write a query to select people with highest salary in each group/*
SELECT *
FROM Worker w1
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM Worker w2
    WHERE w1.DEPARTMENT = w2.DEPARTMENT
);


/*Write a query to fetch departments along with the total salaries paid for each of them/*
SELECT department, SUM(salary) AS total_salary
FROM worker
GROUP BY department;

/*Write a query to fetch the names of workers who earn the highest salary/*
SELECT FIRST_NAME, LAST_NAME
FROM worker
WHERE salary = (
  SELECT MAX(salary)
  FROM worker
);


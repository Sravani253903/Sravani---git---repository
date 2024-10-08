/*create database school*/
use school;

CREATE TABLE STUDENT (
  StdID int(5) PRIMARY KEY,
  StdName VARCHAR(30) NOT NULL,
  Sex VARCHAR(6) Not null,
  Percentage DECIMAL(8,5),
  SClass int,
  Sec VARCHAR(1),
  Stream VARCHAR(10),
  DOB DATE
);

INSERT INTO STUDENT (StdID, StdName, Sex, Percentage, SClass, Sec, DOB) VALUES
  (1001, 'AKSHRA AGARWAL', 2, 70, 11, 1, '1996-11-10'),
  (1002, 'ANJANI SHARMA', 2, 75, 11, 1, '1996-09-18'),
  (1003, 'ANSHUL SAXENA', 1, 78, 11, 1, '1996-11-19'),
  (1004, 'AISHWARYA SINGH', 2, 79, 11, 1, '1996-11-01'),
  (1005, 'AKRITI SAXENA', 2, 76, 11, 1, '1996-09-20'),
  (1006, 'KHUSHI AGARWAL', 2, 77, 11, 1, '2003-09-14'),
  (1007, 'MAAHI AGARWAL', 2, 74, 11, 1, '1997-04-21'),
  (1008, 'MITALI GUPTA', 2, 78, 12, 1, '1997-11-26'),
  (1009, 'NIKUNJ AGARWAL', 1, 58, 12, 1, '1997-07-12'),
  (1010, 'PARKHI', 2, 59, 12, 1, '1997-12-20'),
  (1011, 'PRAKHAR TIWARI', 1, 43, 12, 1, '1997-04-22'),
  (1012, 'RAGHAV GANGWAR', 1, 58, 12, 1, '1997-12-21'),
  (1013, 'SAHIL SARASWAT', 1, 57, 12, 1, '1997-08-13'),
  (1014, 'SWATI MISHRA', 2, 98, 11, 1, '1996-08-13'),
  (1015, 'HARSH AGARWAL', 1, 58, 11, 2, '2003-08-28'),
  (1016, 'HARSHIT KUMAR', 1, 98, 11, 2, '2003-05-22'),
  (1017, 'JAHANVI KAPOOR', 1, 65, 11, 2, '1997-01-10'),
  (1018, 'STUTI MISHRA', 1, 66, 11, 3, '1996-01-10'),
  (1019, 'SURYANSH KUMAR AGARWAL', 1, 85, 11, 3, '2007-08-22'),
  (1020, 'TANI RASTOGI', 2, 75, 12, 3, '1998-01-15'),
  (1021, 'TANISHK GUPTA', 1, 55, 12, 3, '1998-04-11'),
  (1022, 'TANMAY AGARWAL', 1, 57, 11, 3, '1998-06-28'),
  (1023, 'YASH SAXENA', 1, 79, 11, 3, '1998-03-13'),
  (1024, 'YESH DUBEY', 1, 85, 12, 3, '1998-04-03');
 
 /*Lab Activity 2*/
/*1 To display all the records form STUDENT table.*/
SELECT * FROM student ;
/* 2.To display ony name and date of birth from the table STUDENT.*/
SELECT StdName, DOB FROM student ;
/*3.To display all students record where percentage is greater of equal to 80 FROM student table.*/
SELECT * FROM student WHERE percentage >= 80;

/*4.To display student name, stream and percentage where percentage of student is more than 80*/
SELECT StdName, Stream, Percentage from student WHERE percentage > 80;

/*5. To display all records of science students whose percentage is more than 75 form student table.*/
SELECT * From student WHERE stream = 'Science' AND percentage > 75;

select repeat('*', 50)

/*Lab Activity 3*/
/*1.To display the STUDENT table structure.*/
DESCRIBE Student;
/*2.To add a column (FIELD)in the STUDENT table,for example TeacherID as VARCHAR(20)*/
ALTER TABLE Student ADD TeacherID VARCHAR(20);
/*3.Type the statement*/
DESC Student;
/*4.Type the statement and press enter key, note the new field that you have added as TeacherID*/
SELECT * FROM student;
/*5. To modify the TeacherID data type form character to integer.*/
ALTER TABLE Student MODIFY TeacherID INTEGER ;
DESC Student;
SELECT * FROM student;

/*Lab Activity 4*/
/*1. To Drop (Delete) a field form a table. For e.g you wantto delete TeacherID field.*/
ALTER TABLE Student DROP TeacherID;
/*2. To subtract 5 form all students percentage and display name and percentage.*/
SELECT StdName, percentage - 5 FROM Student;
/*3.Using column alise for example we wantto display StdName as Student Name and DOB as Date of Birth then the statement will be.*/
SELECT StdName AS "Student Name",
DOB As "Date_of_Birth" FROM Student;
/*4. Display the name of all students whose stream is not Science*/
SELECT StdName FROM student
WHERE Stream <> 'Science';
/*5. Display all name and percentage where percentage is between 60 and 80*/
SELECT StdName, percentage FROM student WHERE percentage >=60 AND
percentage<=80 ;

/*Lab Activity 5:*/
/*1. To change a student name from SWATIMISHRA to SWATIVERMA whose StdID is 1014 and als change percentage 86.*/
UPDATE Student SET StdName = 'SWATI VERMA', percentage = 86
WHERE StdId = 1014;
/*2. To delete the records form student table where StdId is 1016.*/
DELETE FROM Student WHERE StdID = 1016;
/*3. Type the following SQL statement and note the output.*/
SELECT * FROM Student WHERE StdName LIKE 'G_' ;
SELECT * FROM Student WHERE StdName='G';
SELECT * FROM Student WHERE StdName LIKE 'G%' ;
SELECT * from Student WHERE StdName='%G%' ;
/*4. Display all the streams in student table.*/
SELECT DISTINCT Stream FROM Student;
/*5. Note the output of the following statement.*/
SELECT StdName, Sex, Stream FROM Student WHERE percentage BETWEEN 70 AND 80;

/*My Task*/
CREATE TABLE EMP (
  EMPNO INT,
  ENAME VARCHAR(255),
  JOB VARCHAR(255),
  MGR INT,
  HIREDATE DATE,
  SAL DECIMAL(10, 2),
  COMM DECIMAL(10, 2),
  DEPTNO INT
);

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
  (8369, 'SMITH', 'CLERK', 8902, '1990-12-18', 800.00, NULL, 20),
  (8499, 'ANYA', 'SALESMAN', 8698, '1991-02-20', 1600.00, 300.00, 30),
  (8521, 'SETH', 'SALESMAN', 8698, '1991-02-22', 1250.00, 500.00, 30),
  (8566, 'MAHADEVAN', 'MANAGER', 8839, '1991-04-02', 2985.00, NULL, 20),
  (8654, 'MOMIN', 'SALESMAN', 8698, '1991-09-28', 1250.00, 1400.00, 30),
  (8698, 'BINA', 'MANAGER', 8839, '1991-05-01', 2850.00, NULL, 30),
  (8882, 'SHIVANSH', 'MANAGER', 8839, '1991-06-09', 2450.00, NULL, 10),
  (8888, 'SCOTT', 'ANALYST', 8566, '1992-12-09', 3000.00, NULL, 20),
  (8839, 'AMIR', 'PRESIDENT', NULL, '1991-11-18', 5000.00, NULL, 10),
  (8844, 'KULDEEP', 'SALESMAN', 8698, '1991-09-08', 1500.00, 0.00, 30);
  
/*1a. Write a query to display EName and Sal of employees whose salary are greater than or equal to 2200?*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 2200;
/*1b. Write a query to display details of employs who are not getting commission?*/
SELECT *
FROM EMP
WHERE COMM IS NULL;
/*1c. Write a query to display employee name and salary of those employees who don’t have their salary in range of 2500 to 4000?*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL < 2500 OR SAL > 4000;
/*1d. Write a query to display the name, job title and salary of employees who don’t have manager?*/
SELECT ENAME, JOB, SAL
FROM EMP
WHERE MGR IS NULL;
/*1e. Write a query to display the name of employee whose name contains “A” as third alphabet?*/
SELECT ENAME
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'A';
/*1f. Write a query to display the name of employee whose name contains “T” as last alphabet?*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%T';
/*1g. Write a query to display the name of employee whose name contains ”M” as First and “L” as third alphabet?*/
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'M_L%';
/*1h. Write a query to display details of employs with the text “Not given”, if commission is null?*/
SELECT   EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COALESCE(COMM, 'Not given') AS COMM, DEPTNO
FROM EMP
WHERE COMM IS NULL;
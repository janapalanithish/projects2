CREATE TABLE info1(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    email TEXT UNIQUE NOT NULL,
    rate_limits INTEGER NOT NULL,
    PLAN TEXT NOT NULL
    );
    INSERT INTO info1(id , name , age , email , rate_limits , PLAN)
    VALUES (?,?,?,?,?,?);
    SELECT name from info1;
    UPDATE info1
    SET rate_limits = 10
    WHERE id = 1;
    DELETE FROM info1
    WHERE rate_limits > 10;
    UPDATE info1
    SET PLAN = 'premium' , rate_limits = 1000
    WHERE id = 1;
    CREATE TABLE info3(
    name INTEGER NOT NULL,
    age INTEGER NOT NULL,
    email UNIQUE NOT NULL,
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    rate_limits INTEGER ,
    PLAN TEXT NOT NULL
    );
    INSERT INTO info3(name , age , email , rate_limits , PLAN)
    VALUES(?,?,?,?,?);
    SELECT PLAN FROM info3;
    UPDATE info3
    SET rate_limits = 100
    SET PLAN = 'premium'
    WHERE id = 1;
 -- learning constraint
 CREATE DATABASE info;

USE info;
-- executing unique constarint 
CREATE TABLE infoy(
       phone_number INT UNIQUE
       );
INSERT INTO infoy(phone_number)
VALUES 
( 233 ),
( 432 ),
( 124 );
-- executing not null constarint 
CREATE TABLE inoyr(
user_name TEXT NOT NULL
);
INSERT INTO inoyr(user_name)
VALUES 
("you"),
("kumar"),
("abhi");
-- exectuting the check constarint 
CREATE TABLE info12(
age INT CHECK(age >=18)
);
INSERT INTO info12(age)
VALUES 
(19);
-- exeuting default constaint 
CREATE TABLE newstudents(
gamer_name varchar(50) default 'TOMMAY123',
age INT NOT NULL 
);
INSERT INTO newstudents(age)
VALUES 
(19)
-- executing primary key 
CREATE TABLE student1(
age INT PRIMARY KEY ,
user_name TEXT NOT NULL 
);
INSERT INTO student1(age , user_name)
VALUES 
(12 , "nithish"),
(43 , "mohan"),
( 23 , "rutwik");
CREATE TABLE student2(
subjects TEXT ,
FOREIGN KEY (presnent_id) references student1(age)
);
INSERT INTO student2(subjects , presnent_id)
VALUES ("maths" , 1),
("science" , 2),
("chem" , 3);
CREATE DATABASE employees;

USE employees;

CREATE TABLE employee_info(
id INT PRIMARY KEY,
user_name TEXT NOT NULL ,
department TEXT NOT NULL,
salary INT
);
INSERT INTO employee_info(id , user_name , department , salary)
VALUES
(1 , 'raj' , 'HR' , 100000),
(2 , 'raja' , 'manager' , 20000);
UPDATE employee_info
SET salary  = 50000
WHERE department = 'HR';
SET SQL_SAFE_UPDATES = 0;
UPDATE employee_info
SET user_name = 'raaj'
WHERE user_name = 'raj';

SELECT * FROM employee_info;
CREATE DATABASE employeeinfo;

USE employeeinfo;

CREATE TABLE inf01(
id INT PRIMARY KEY,
user_name TEXT NOT NULL,
department TEXT NOT NULL,
salary INT
);
INSERT INTO inf01(id , user_name , department , salary)
VALUES 
(1 , 'nithish' , 'HR' , 10000),
(2 , 'raj' , 'manager' , 12345),
(3 , 'kiran' , 'employee' , 5432);
SET SQL_SAFE_UPDATES = 0;
DELETE FROM inf01
WHERE department = 'HR';
select * from inf01;
DELETE FROM inf01
WHERE user_name = 'raj';
SELECT * FROM inf01;
SELECT user_name , salary FROM inf01;

CREATE DATABASE employeeinfo;

USE employeeinfo;

CREATE TABLE inf01(
id INT PRIMARY KEY,
user_name TEXT NOT NULL,
department TEXT NOT NULL,
salary INT
);
INSERT INTO inf01(id , user_name , department , salary)
VALUES 
(1 , 'nithish' , 'HR' , 10000),
(2 , 'raj' , 'manager' , 12345),
(3 , 'kiran' , 'employee' , 5432);
SET SQL_SAFE_UPDATES = 0;
DELETE FROM inf01
WHERE department = 'HR';
select * from inf01;
DELETE FROM inf01
WHERE user_name = 'raj';
SELECT * FROM inf01;
SELECT user_name , salary FROM inf01;
ALTER TABLE inf01
ADD info VARCHAR(50) DEFAULT 'VERY GOOD EMPLOYEE';
SELECT * FROM inf01;
DELETE FROM inf01
WHERE age = NULL;
SELECT * FROM inf01;
ALTER TABLE inf01
ADD child_dob INT DEFAULT 10;
SELECT * FROM inf01;
ALTER table inf01
DROP COLUMN age;
SELECT * FROM inf01;
ALTER TABLE  inf01
MODIFY child_dob TEXT;
SELECT * FROM inf01;

ALTER TABLE inf01
CHANGE child_dob   date_of_joining INT;
SELECT * FROM inf01;
-- learning about the reanme command
CREATE DATABASE nexusinfo;

USE nexusinfo;

CREATE TABLE nexusinfo1(
id INT PRIMARY KEY ,
user_name TEXT NOT NULL ,
user_age INT ,
user_profession TEXT NOT NULL 
);
INSERT INTO nexusinfo1(id , user_name , user_age , user_profession)
VALUES 
(1 , 'nithish' , 18 , 'student'),
(2 , 'kumar' , 19 , 'teacher'),
( 3 , 'shiva' , 21 , 'software engineer');


ALTER TABLE nexusinfo1
RENAME column id to user_id;

SELECT user_id FROM nexusinfo1;
SELECT * FROM nexusinfo1;
SHOW WARNINGS ;

CREATE DATABASE babu;

USE babu;
-- learning TRUNCATE command 
CREATE TABLE bauinfo(

id INT PRIMARY KEY,
user_name TEXT NOT NULL,
user_age INT ,
department TEXT,
salary INT
);

INSERT INTO bauinfo(id , user_name , user_age , department , salary)

VALUES 
(1 , 'nithish' , 18 , 'HR' , 200000),
(2 , 'kumar' , 19 , 'manager' , 10000000);

TRUNCATE TABLE bauinfo;
SELECT * FROM bauinfo;

SHOW warnings;
-- differnece between TRUNCATE , delete , DROP
CREATE TABLE my_info(

id INT PRIMARY KEY,
user_name TEXT,
user_age INT ,
user_intrest TEXT ,
user_techstack TEXT 
);
INSERT INTO my_info(id , user_name , user_age , user_intrest , user_techstack)
VALUES 
(1 , 'nithish' , 18 , 'TECH' , 'HTML CSS JS'),
(2 , 'karthik' , 20 , 'TECH' , ' DSA ' );

DELETE FROM my_info 
WHERE user_name = 'nithish';
SET SQL_SAFE_UPDATES = 0;
SHOW WARNINGS;
SELECT * FROM my_info;


SELECT * FROM my_info;
-- learning distinct command 
CREATE TABLE newinfo(
id INT PRIMARY KEY,
user_name TEXT,
department TEXT,
salary INT
);
INSERT INTO newinfo(id , user_name , department , salary)

VALUES  
(1 , 'nithish' , ' manager ' , 20000),
(2 , 'karhik' , 'CEO' , 1000000000),
(3 , 'nithish' , 'HR' , 20000);


SELECT distinct user_name
FROM newinfo;

SELECT distinct user_name , salary 
FROM newinfo;

-- multiple distinct columns
SELECT distinct user_name , salary 
FROM newinfo;

CREATE DATABASE newfor;

USE newfor;

CREATE TABLE newwith(
id INT PRIMARY KEY,
user_name TEXT NOT NULL,
age INT,
salary INT,
department TEXT NOT NULL
);

INSERT INTO newwith(id , user_name , age , salary , department)
VALUES 
(1,'nithish', 20 , 20000 , 'HR'),
(2, 'karthik' , 23 , 1234567890 ,'CEO');
-- using operators 
SELECT * FROM newwith WHERE age+1=21;
-- using logic operators 
SELECT * FROM newwith WHERE age = 20 AND id =2;
SELECT * FROM newwith WHERE age = 20 OR id =2;

SELECT * FROM newwith WHERE user_name NOT IN ('nithish','karthik');

-- using null/not null

SELECT * FROM newwith WHERE age is NULL;

-- like and wildcard operations 

SELECT * FROM newwith WHERE user_name LIKE 'n%';
SELECT * FROM newwith WHERE user_name LIKE '_h%';

-- between operator 
SELECT * FROM newwith WHERE salary BETWEEN 19999 AND 1234567891;

SHOW WARNINGS;

CREATE TABLE collegeinfo(
id INT PRIMARY KEY,
user_name TEXT,
age INT,
college_name TEXT NOT NULL
);

INSERT INTO collegeinfo(id , user_name , age ,college_name)

VALUES
(1,'hindooj' , 19 , 'ANITS'),
(2 , 'lohit' , 21 , 'ANITS'),
(3, 'rutwik' , 19 , 'ANITS');
-- learning about limit command 
SELECT * FROM collegeinfo LIMIT 2;

-- order by  command 
SELECT * FROM collegeinfo ORDER BY age DESC;

UPDATE collegeinfo
SET user_name = 'lohit'
WHERE id = 5;

SELECT * FROM collegeinfo;
SELECT * FROM collegeinfo ORDER BY age ASC;


CREATE DATABASE employee;

USE employee;

CREATE TABLE emplinfo(
id INTEGER PRIMARY KEY,
user_name VARCHAR(50),
age INT ,
salary INT,
department VARCHAR(10) NOT NULL
);

INSERT INTO emplinfo(id , user_name , age , salary , department)

VALUES 
(1 , 'nithish' , 19 , 10000 , 'worker'),
(2 , 'Karthik' , 21 , 1234567 , 'HR'),
(3 , 'tanush' , 15 , 654321 , 'CEO');
-- basic quesry questions
SELECT * FROM emplinfo
WHERE id = 2;
-- using or opeartor 
SELECT * FROM emplinfo
WHERE id = 1 OR department = 'HR';
-- using comparator , logical operator , where cluase 
SELECT * FROM emplinfo
WHERE salary > 1200 OR department = 'HR';
-- using not logical operator 
SELECT * FROM emplinfo
WHERE department NOT in('HR');
-- using ASC/desc operation

SELECT * FROM emplinfo 
ORDER BY salary DESC;
-- using two clauses 


SELECT * FROM emplinfo 
ORDER BY salary ASC LIMIT 2;

-- learning the group by and having cluase 
CREATE DATABASE class;

USE class;

CREATE TABLE classinfo(
id INTEGER PRIMARY KEY,
marks INTEGER,
section varchar(20) NOT NULL
);

INSERT INTO classinfo(id , marks , section)
VALUES 
(1 , 70 , 'a'),
(2 , 69 , 'a'),
(3 , 93 , 'a'),
(4 , 92 , 'b'),
(5 , 92 , 'b'),
(6 , 23 , 'c'),
(7 , 93 , 'c'),
(8 , 100 , 'c'),
(9 , 82 , 'a'),
(10 , 83 , 'b');

SELECT section , avg(marks) AS avgmarks 
FROM classinfo
GROUP BY section
having avg(marks) > 60;

SHOW WARNINGS;

CREATE DATABASE practise;
USE practise;

-- 1. Create Parent Table
CREATE TABLE info(
    id INT PRIMARY KEY,
    user_name TEXT,
    user_role VARCHAR(20),
    salary INT 
);

-- 2. Insert Data
INSERT INTO info(id, user_name, user_role, salary)
VALUES
(1, 'nithish', 'HR', 1200),
(2, 'karthik', 'ceo', 23423),
(3, 'tanush', 'emplyee', 4322),
(4, 'sandeep', 'emplyee', 2345);

-- 3. Modify Table (Added DEFAULT '' to handle existing rows)
ALTER TABLE info 
ADD user_profile VARCHAR(50) NOT NULL DEFAULT 'Pending';

UPDATE info
SET user_profile = 'he is an advanced AI specailist'
WHERE id = 2;

-- 4. Create Child Table with Foreign Key
CREATE TABLE anoinfo(
    empl_id INT,              -- Added this column
    backlogs INT,
    increment INT,            -- Fixed spelling to 'increment'
    feedback VARCHAR(50) NOT NULL, -- Increased size to fit your long text
    FOREIGN KEY (empl_id) REFERENCES info(id)
);

-- 5. Insert Child Data
-- Note: All empl_id values here (1, 2, 4, 3) must exist in 'info' table
INSERT INTO anoinfo(backlogs, increment, feedback, empl_id)
VALUES 
(1, 1000, 'good at projct rewiew', 1),
(0, 2000, 'good at code execution', 2),
(0, 3000, 'good at project explantion', 4),
(5, 100, 'good at communication', 3);

SELECT * FROM info;
SELECT * FROM anoinfo;

-- 6. Delete User (This effectively tests the constraint)
-- Note: This might fail now because 'anoinfo' depends on ID 1. 
-- To delete ID 1, you must first delete the row in 'anoinfo' or use ON DELETE CASCADE.
DELETE FROM info WHERE id = 1;

CREATE DATABASE must;

USE must;

CREATE TABLE mustinfo(
id INTEGER PRIMARY KEY,
user_name VARCHAR(50),
salary INT ,
department TEXT 
);
INSERT INTO mustinfo(id , user_name , salary , department)
VALUES
(1 , 'nithish' , 65432 ,'IT'),
(2 , 'kuamr' , 65432 , 'ECE'),
(3 , 'lohit' , 23456 , 'CSM');
-- count function
SELECT count(user_name) FROM mustinfo;
-- sum function
SELECT sum(salary) FROM mustinfo;

UPDATE mustinfo 
SET salary = 65433
WHERE id = 2;
-- max function
SELECT MAX(salary) FROM mustinfo;
-- min function 
SELECT MIN(salary) FROM mustinfo;
-- avg function
SELECT AVG(salary) FROM mustinfo;

SELECT COUNT(department) FROM mustinfo;
SELECT * FROM mustinfo;

SELECT avg(salary) FROM mustinfo WHERE id =1;
SELECT * FROM mustinfo;

-- group by and having 
SELECT department ,  avg(salary) FROM mustinfo
group by department 
having salary > 100000;

SELECT department , user_name , avg(salary) FROM mustinfo
GROUP BY department , user_name 
having salary > 10000

CREATE DATABASE info;

USE info;

CREATE TABLE info1(
id INT PRIMARY KEY ,
city VARCHAR(50),
salary INT
);
INSERT INTO info1(id , city , salary)

VALUES
(1 , 'vizag' , 6543),
(2 , 'VIZ' , 5432),
(3 , 'guntur' , 23456);

SELECT city , MAX(salary)  AS max_sal
FROM info1
GROUP BY city
 ORDER BY max_sal DESC;

SELECT department , count(

-- practice questions 
CREATE DATABASE empl1;

USE empl1;

CREATE TABLE emplinfo1(
id INT PRIMARY KEY,
department VARCHAR(50),
salary INT 
);

INSERT INTO emplinfo1(id , department , salary)

VALUES 
(1 , 'HR' , 1000),
(2 , 'IT' , 1200),
(3 , 'HR' , 1300),
(4 , 'IT' , 1400);


SELECT department , AVG(salary) AS avg_sal 
FROM emplinfo1
GROUP BY department 
HAVING avg_sal > 1000;

SHOW WARNINGS;

CREATE DATABASE x1;

USE x1;

CREATE TABLE x_a(
id INT PRIMARY KEY ,
user_name VARCHAR(50) NOT NULL,
salary INT,
department TEXT NOT NULL
);

INSERT INTO x_a(id , user_name , salary , department)

VALUES
(1 , 'nithish' , 65432 , 'IT'),
(2 , 'karthik' , 23456 , 'IT'),
(3 , 'tanush' , 23456 , 'HR');
-- alter add command 
ALTER TABLE x_a
ADD user_info VARCHAR(50) NOT NULL;
-- alter drop command
ALTER TABLE x_a
DROP column user_info;
-- alter modify command
ALTER TABLE x_a
MODIFY department VARCHAR(50);
-- alter change command
ALTER TABLE x_a
CHANGE user_name empl_name TEXT;

SELECT * FROM x_a;
-- alter rename command 
ALTER TABLE x_a
RENAME COLUMN  salary to montly_salary;

-- distinct command 
SELECT distinct empl_name , department 
FROM x_a;


SHOW WARNINGS;

CREATE DATABASE w1;

USE w1;

CREATE TABLE w2( 
id INT PRIMARY KEY,
department VARCHAR(50)
);
INSERT INTO w2(id , department)

VALUES
(1 , 'ECE'),
(2 , 'IT'),
(3 , 'ECE'),
(4 , 'CSE');

CREATE TABLE w3(
id INT,
cgpa INT 
);
-- inner join function 
INSERT INTO w3(id , cgpa)
VALUES
(2 , 9.0),
(3 , 7.6),
(4, 9.3),
(5 , 7.6);

SELECT w2.id , w2.department , w3.cgpa
FROM w2
INNER JOIN w3
ON w2.id = w3.id;

SHOW WARNINGS;
 
 CREATE DATABASE v3;

USE v3;

CREATE TABLE v0(
id INT PRIMARY KEY,
section VARCHAR(20)
);
-- interview questons
INSERT INTO v0(id , section)
VALUES
(1 , 'C'),
(2 , 'A'),
(3 , 'A'),
(4 , 'C'),
(5 , 'null');

UPDATE v0
SET section = NULL 
WHERE id = 5;

SELECT section , count(section)
FROM v0
GROUP BY section;
CREATE DATABASE m1;

USE m1;

CREATE TABLE m2(
id INT,
user_name VARCHAR(50)
);
INSERT INTO m2(id , user_name)
VALUES 
(1 , 'nithish'),
(2 , 'kumar'),
(3 , 'yashimina');

CREATE TABLE m3(
id iNT,
subject_name VARCHAR(50)
);

INSERT INTO m3(id , subject_name)

VALUES 
(2 , 'maths'),
(3 , 'english'),
(4 , 'you');
-- left join
SELECT  user_name , subject_name
FROM m2
LEFT JOIN m3
ON m2.id = m3.id;
-- right join
SELECT *
FROM m2
RIGHT JOIN m3
ON m2.id = m3.id;
-- innner join 
SELECT * 
FROM m2 
INNER JOIN m3
ON m2.id = m3.id;


SHOW WARNINGS;

-- cross join 
SELECT * 
FROM d2 
CROSS JOIN d3;
CREATE DATABASE IF NOT exists m1;

USE m1;

CREATE TABLE m2(
id INT PRIMARY KEY,
user_name VARCHAR(50)
);

INSERT INTO m2(id , user_name)
VALUES
(1 , 'nithish'),
(2 , 'karthik'),
(3 , 'tanush'),
(4 , 'sandeep');

CREATE TABLE m3(
id INT ,
salary INT 
);
INSERT INTO m3(id , salary)

VALUES
(1 , 234567),
(2 ,6543),
(3 , 234567),
(4 ,654334),
(5 , 987654);

SELECT *
FROM m2
INNER JOIN m3
ON m2.id = m3.id;


SELECT *
FROM m2
RIGHT JOIN m3
ON m2.id = m3.id;

SELECT *
FROM m2
LEFT JOIN m3
ON m2.id = m3.id;

SELECT *
FROM m2
CROSS JOIN m2;


SELECT *
FROM m2
LEFT JOIN m3
ON m2.id = m3.id;
UNION 
SELECT *
FROM m2
RIGHT JOIN m3
ON m2.id = m3.id;

SHOW WARNINGS;

 CREATE DATABASE s1;
USE S1;

CREATE TABLE o1(
id INT PRIMARY KEY,
user_name VARCHAR(50)
);
INSERT INTO o1(id , user_name )
VALUES 
(1 , 'nithish'),
(2 , 'karthik');

CREATE TABLE o2(
id INT ,
salary INT 
);
INSERT INTO o2(id , salary)

VALUES 
(1 , 5432),
(2 , 54322),
(3 ,23456),
(4 ,765432);
-- left exclusive join
SELECT *
FROM o1
LEFT JOIN o2
ON o1.id = o2.id
WHERE o2.id IS NULL;
-- right exclusive join

SELECT *
FROM o1
RIGHT JOIN o2
ON o1.id = o2.id
WHERE o1.id IS NULL;
-- full exclusive join 
SELECT *
FROM o1
LEFT JOIN o2
ON o1.id = o2.id
WHERE o2.id IS NULL
UNION 
SELECT *
FROM o1
RIGHT JOIN o2
ON o1.id = o2.id
WHERE o1.id IS NULL;

-- self join

SELECT *
FROM o1 as b1 -- we can name any name for the table in the place of b1 as per your wish
JOIN o2 as b2 -- as same for first table rules
ON o1.id = o2.id;

CREATE DATABASE q1;

USE q1;

CREATE TABLE e1(
id INT PRIMARY KEY,
user_name VARCHAR(50)
);

INSERT INTO e1(id , user_name)
VALUES 
(1 , 'nithish'),
(2 , 'karthik');

CREATE TABLE e2(
id INT ,
salary INT
);
INSERT INTO e2(id , salary)

VALUES
(1 , 12345),
(2 , 12345),
(3 , 345654),
(4 ,234543);
-- union command 
SELECT *
FROM e1
RIGHT JOIN e2
ON e1.id = e2.id

UNION

SELECT *
FROM e1
LEFT JOIN e2
ON e1.id = e2.id;

SHOW WARNINGS;

-- union all 
SELECT *
FROM e1 
RIGHT JOIN e2
ON e1.id = e2.id
UNION ALL
SELECT *
FROM e1
LEFT JOIN e2
ON e1.id = e2.id;
-- method using quesries and sub queries
SELECT salary
FROM e2
WHERE salary > (SELECT min(salary) FROM e2) ;

-- method one of finding the salary > min(salary)
SELECT max(salary) as sal_no
FROM e2
GROUP BY id
ORDER BY sal_no ASC;

CREATE DATABASE age;

USE age;

CREATE TABLE age_calc(
id INT PRIMARY KEY,
user_name VARCHAR(50),
age INT
);

INSERT INTO age_calc(id , user_name , age)
VALUES 
(1 , 'nithish' , 19),
(2 , 'karthik' , 21),
(3 , 'vice' , 25),
(4 , 'king' , 29);

SELECT age ,  user_name 
FROM age_calc
WHERE age = (SELECT MIN(age) FROM age_calc);

SELECT age , id , user_name 
FROM age_calc
WHERE age = min(age);

SELECT *
FROM age_calc
WHERE age_calc.age > (SELECT MIN(age) FROM age_calc);

SELECT AVG(age)AS avg_age FROM age_calc;

SELECT age , (SELECT AVG(sal) FROM age_calc) as avg_age
FROM age_calc;
CREATE DATABASE sorting;

USE sorting;
-- finding nth highest value in salary 
CREATE TABLE so2(
id INT PRIMARY KEY,
user_name VARCHAR(50),
salary INT
);
INSERT INTO so2(id , user_name , salary)
VALUES 
(1 , 'nithish' , 100),
(2 , 'karthik' , 121),
(3 ,  'tanush' , 122),
(4 , 'sandeep' , 124),
(5 , 'harish' , 129 ),
(6 , 'abhilash' , 130),
(7  , 'teja' , 131);

SELECT MAX(salary) as max_sal
FROM so2
GROUP BY id 
ORDER BY max_sal DESC LIMIT 2;


SHOW WARNINGS;

CREATE DATABASE db1;
USE db1;

CREATE TABLE tb1(
id INT PRIMARY KEY,
salary INT
);
INSERT INTO tb1(id , salary)
VALUES 
(1 , 100),
(2 , 101),
(3 , 102),
(4 , 103);
-- to get the third highest value from the table
SELECT distinct salary
FROM tb1
ORDER BY salary DESC LIMIT 2,1;
-- to get the second least value from the table 
SELECT distinct salary
FROM tb1
ORDER BY salary ASC LIMIT 1,1;
-- procedural without parameters
DELIMITER /
CREATE PROCEDURE info()
BEGIN 
SELECT * FROM tb1 
END;
DELIMITER /
CALL info();
-- procedural with parameters
CREATE PROCEDURE info(n)
BEGIN 
SELECT * FROM tb1 WHERE id = id;
END;
CALL info(2)

CREATE DATABASE nm1;

USE nm1;

CREATE TABLE y1(
id INT PRIMARY KEY,
user_name VARCHAR(50),
pass_word VARCHAR(50) UNIQUE,
salary INT
);
INSERT INTO y1(id , user_name , pass_word , salary)
VALUES
(1 , 'nithish' , 'nithish@123' , 1220),
(2 , 'karthik' , 'karthik@123' , 1000),
(3 , 'tanush' ,  'tanush@123' , 1100);
-- view concept
CREATE VIEW new_name AS 
SELECT id , user_name , salary FROM y1;

SELECT * FROM new_name;

SHOW WARNINGS;









































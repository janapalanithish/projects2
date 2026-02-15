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


















































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








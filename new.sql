CREATE TABLE myinfo(
name TEXT,
age INTEGER,
gender TEXT,
);
INSERT INTO myinfo(name , age , gender)
VALUES ('nithish',18,'male');
DELETE FROM myinfo WHERE name = 'nithish';
SELECT name FROM myinfo;
UPDATE myinfo
SET name = 'rutwik',
age = 19,
gender = 'male';
WHERE myinfo.name = 'nithish';
SELECT name 
FROM myinfo
WHERE name = 'nithish';
#creating a new customer info
CREATE TABLE newcustomer(
name TEXT,
age INTEGER,
mail TEXT,
gender TEXT,
pass_word TEXT
);
UPDATE myinfo;
WHERE id =1 ;
WHERE mail = '123@gmail.com';
SET name = 'rutwik';
UPDATE myinfo
INSERT INTO newcustomer(name , age , mail , gender , pass_word)
VALUES ('nithish',18,'nithish@gmail.com','male','nithish123');
DELETE FROM newcustomer 
WHERE name = 'nithish';
SELECT name FROM newcustomer;
UPDATE newcustomer
SET name = 'rutwik'
WHERE name = 'nithish';
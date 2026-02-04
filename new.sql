CREATE TABLE setvalues(
     id INTEGER ,
     name TEXT ,
     mail TEXT ,
     age INTEGER ,
     gender TEXT ,
     );
INSERT INTO setvalues(id , name , mail , age , gender)
VALUES (1,'nithish','nithish@example.com',20,'male');
DELETE FROM setvalues
WHERE name = 'nithish';
SELECT * FROM setvalues;
   DELETE FROM setvalues WHERE age > 18;
   SELECT * FROM setvalues;
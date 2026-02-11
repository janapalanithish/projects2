CREATE DATABASE nexus;

USE nexus;

CREATE TABLE userinfo (
       id INTEGER PRIMARY KEY ,
       user_name TEXT NOT NULL ,
       email TEXT PRIMARY KEY,
       password_hash TEXT NOT NULL 
       );
       INSERT INTO userinfo(id , user_name , email , password_hash )
       VALUES (1,"nithish","123@gmail.com" , "123344");
CREATE TABLE plans(
	   chat_id INTEGER ,
       model TEXT ,
       no_searches INTEGER ,
       FOREIGN KEY (chat_id) REFERENCES userinfo(id)
       );
       INSERT INTO plans(chat_id , model , no_searches )
       VALUES (1 , "free" , 10);
       
       UPDATE plans 
       SET model = "premium";
       WHERE model = "free";
       SET no_searches = 100 ;
       WHERE model = "premium";
       IF no_searches >= 100 
        THEN DELETE FROM plans
        WHERE no_searches >= 100;
        CREATE DATABASE nexus;
USE nexus;

CREATE TABLE userinfo(
    id INT PRIMARY KEY,
    user_name TEXT NOT NULL,
    user_age INT NOT NULL,
    tasks_used TEXT NOT NULL
);

INSERT INTO userinfo(id, user_name, user_age, tasks_used)
VALUES 
(1, 'nithish', 18, 'used for image generation using prompts'),
(2, 'raj', 18, 'used for prompt generation');

CREATE TABLE prompts(
    user_id INT,
    plan TEXT NOT NULL,
    no_prompts INT,
    FOREIGN KEY (user_id) REFERENCES userinfo(id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
    CHECK (
        (plan = 'free' AND no_prompts = 10) OR
        (plan = 'premium' AND no_prompts = 100)
    )
);

INSERT INTO prompts(user_id, plan, no_prompts)
VALUES 
(1, 'free', 10),
(2, 'premium', 100);
SELECT * FROM prompts;
SHOW TABLES;
UPDATE userinfo 
SET user_name = 'manish'
where id = 1;
SHOW TABLES;
select * from userinfo;
UPDATE userinfo 
SET id = 0
WHERE user_name = 'raj';
select * from userinfo;

            /*OVER THE TASK TO BACKEND TO UPGRADE THE PLAN WITH GIVING A POPUP USING FRONTEND
/* THE TASK IS UPTO BACKEND IF THE LIMIT REACHES 
/*NEED TO UPDATE THE PLANS IF THE USER BUYS THE NEW VERSION 

       
       
       
       
       
       
       
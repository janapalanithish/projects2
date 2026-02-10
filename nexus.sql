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
            /*OVER THE TASK TO BACKEND TO UPGRADE THE PLAN WITH GIVING A POPUP USING FRONTEND
/* THE TASK IS UPTO BACKEND IF THE LIMIT REACHES 
/*NEED TO UPDATE THE PLANS IF THE USER BUYS THE NEW VERSION 

       
       
       
       
       
       
       
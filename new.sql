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
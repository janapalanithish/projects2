CREATE TABLE info(
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    pass_word INTEGER UNIQUE NOT NULL,
    plan TEXT NOT NULL
);

-- I added actual data here instead of '?'
INSERT INTO info(id, name, email, pass_word, plan)
VALUES (1, 'John Doe', 'john@example.com', 12345, 'basic');

UPDATE info
SET plan = 'premium'
WHERE id = 1; -- Always add a WHERE clause to updates!

SELECT * FROM info WHERE id = 1;
-- Create the table
CREATE TABLE users (
    name VARCHAR(10) UNIQUE
);

-- Insert users
INSERT INTO users (name) VALUES ('Nombre1');
INSERT INTO users (name) VALUES ('Nombre2');
INSERT INTO users (name) VALUES ('Nombre3');

-- Insert multiple users 
INSERT INTO users (name) VALUES ('Fernando'), ('Melissa'), ('Pedro'), ('Pelissari'), ('Melissa2'), ('Elisa');

-- Change a user's name
UPDATE users
SET name = 'kilo'
WHERE name = 'Fernando';

-- Show two users, skipping the first two
SELECT *
FROM users
LIMIT 2 OFFSET 2;

-- Show user with the name 'kilo'
SELECT *
FROM users
WHERE name = 'kilo';

-- Show users whose names start with 'No'
SELECT *
FROM users
WHERE name LIKE 'No%';

-- Show users whose names end with '3'
SELECT *
FROM users
WHERE name LIKE '%3';

-- Show users whose names contain 'lis' starting from the third character
SELECT *
FROM users
WHERE name LIKE '__lis%';

-- Delete users whose names contain 'lis' starting from the third character
DELETE FROM users
WHERE name LIKE '__lis%';

-- Delete all users
DELETE FROM users;

-- Drop the table
DROP TABLE users;

-- Truncate the table
TRUNCATE TABLE users;

-- DELETE: This command is used to remove specific rows from a table. 
-- It can be used with a WHERE clause to specify which rows to delete. 
-- DELETE is a logged operation, meaning each deleted row can be recovered 
-- if the database is restored to a point before the deletion. 
-- DELETE does not free up the space occupied by the table; it only removes the data.

-- DROP: DROP TABLE is used to completely remove a table and its structure from the database. 
-- Once you execute DROP, the table and all its data are permanently deleted and cannot be recovered. 
-- This command also frees up the space that the table was occupying.

-- TRUNCATE: TRUNCATE TABLE is also used to delete all the data from a table, 
-- but it does so in a faster and more efficient manner than DELETE. 
-- It does not delete the table itself, only empties its data. 
-- Unlike DELETE, TRUNCATE is not logged at the row level, 
-- meaning you cannot undo the operation with a transaction.
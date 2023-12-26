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

-- Select various name manipulations
SELECT
    id,
    UPPER(name) AS upper_name,
    LOWER(name) AS lower_name,
    LENGTH(name) AS length, -- Get the length of the name
    LENGTH(name) * 2 AS operation, -- Perform a calculation with the length
    '*' || ' - ' || id || ' -' || name || '- ' as barcode,
    CONCAT(id, ' - ', name) as concatenated,
    name
FROM
    users;

-- Select names, split into first and last names
SELECT
    name,
    SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
    SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name,
    TRIM(SUBSTRING(name, POSITION(' ' IN name))) AS trimmed_last_name
FROM
    users;

-- Update to set first and last names
UPDATE
    users
SET
    first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
    last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);

SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	-- followers > 4600 AND followers < 4700
	followers BETWEEN 4601 AND 4699
ORDER BY
	followers ASC;


SELECT
	COUNT(*) AS total_users,
	MIN(followers) AS min_followers,
	MAX(followers) AS max_followers,
	AVG(followers) as avg_followers,
	ROUND(AVG(followers)) as avg_followers_round,
	ROUND(AVG(followers), 2) as avg_followers_round_two_decimals,
	SUM(followers) / count(*) as avg_manual
FROM
	users;

SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	followers = 4999
	OR followers = 4;

SELECT
	COUNT(*),
	followers
FROM
	users
WHERE
	followers = 4999
	OR followers = 4
GROUP BY
	followers;

SELECT
	COUNT(*),
	followers
FROM
	users
WHERE
	followers BETWEEN 4601 AND 4999
GROUP BY
	followers
ORDER BY
	followers ASC;

SELECT
	COUNT(*) as total,
	country
FROM
	users
GROUP BY
	country
HAVING
	COUNT(*) > 5
ORDER BY
	COUNT(*)
	DESC;

select DISTINCT country from users;

SELECT
	count(*),
	substring(email, position('@' IN email) + 1) AS DOMAIN
FROM
	users
GROUP BY
	substring(email, position('@' IN email) + 1)
HAVING
	count(*) > 1
ORDER BY
	count(*) ASC;


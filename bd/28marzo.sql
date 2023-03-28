USE NETFLIX;

SELECT * FROM MOVIES;

SELECT title, gender FROM movies WHERE year > '1990-01-01';

SELECT * FROM movies WHERE category='Top 10';

UPDATE movies SET year = '1997-01-01' WHERE title='La vita è bella';

SELECT * FROM actors;

SELECT * FROM actors WHERE birthday BETWEEN '1650-01-01' AND '1960-01-01';

SELECT name, lastname FROM actors WHERE country='Estados Unidos';

SELECT * FROM users WHERE plan_details='Standard';

DELETE FROM users WHERE name LIKE 'M%';

SELECT * FROM USERS;

ALTER TABLE actors ADD photo VARCHAR(45);
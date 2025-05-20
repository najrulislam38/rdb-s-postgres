SELECT * FROM students;

-- SELECT * FROM students WHERE country = 'USA' OR country = 'Canada' OR country = 'UK';

SELECT * FROM students WHERE country IN ('USA', 'UK', 'Canada');

SELECT * FROM students WHERE country NOT IN ('USA', 'UK', 'Canada');

SELECT * FROM students WHERE age BETWEEN 20 and 22 ORDER BY age ASC;

SELECT *
FROM students
WHERE
    date_of_birth BETWEEN '2000-01-01' and '2005-01-01'
ORDER BY date_of_birth DESC;

SELECT * FROM students WHERE first_name LIKE ('%am');

SELECT * FROM students WHERE first_name LIKE ('A%');

SELECT * FROM students WHERE first_name LIKE ('___a_');

SELECT * FROM students WHERE first_name LIKE ('%a%');

SELECT * FROM students WHERE first_name ILIKE ('a%');
-- ilike case insensitive
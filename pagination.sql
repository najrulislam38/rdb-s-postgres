SELECT * FROM students;

SELECT * FROM students LIMIT 5 OFFSET 4;

SELECT *
FROM students
WHERE
    country in ('USA', 'UK', 'Canada')
LIMIT 5;

SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
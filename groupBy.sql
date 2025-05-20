SELECT * FROM students;

SELECT country, count(*) FROM students GROUP BY country;

SELECT country, count(*), avg(age) FROM students GROUP BY country;

-- Filter Groups Using HAVING to Show Only Countries with Average Age Above 20.60
SELECT country, avg(age)
FROM students
GROUP BY
    country
HAVING
    avg(age) > 20.6;

-- Count Students Born in Each Year

SELECT extract(
        YEAR
        from date_of_birth
    ) as birth_year, count(*)
FROM students
GROUP BY
    birth_year;
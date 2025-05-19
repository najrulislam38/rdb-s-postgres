/*
@Scalar functions
UPPER() Converts a string to uppercase.
LOWER() Converts a string to lowercase.
CONCAT() Concatenates two or more strings.
LENGTH() Returns the number of characters in a string.

@Aggregate functions
AVG() Calculate the average of a set of values.
MAX() Returns the max value in a set.
MIN() Returns the minimum value in a set.
SUM Calculates the sum of values in a set.
COUNT() Counts the number of rows in a set.

*/

SELECT * FROM students;

SELECT upper(first_name), * FROM students;
-- use upper

SELECT concat(first_name, ' ', last_name) as "Full Name"
FROM students;
-- use concat

-- Aggregate return a single value from the hold table.
SELECT avg(age) FROM students;

SELECT max(age) FROM students;

SELECT count(*) FROM students;
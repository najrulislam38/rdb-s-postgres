CREATE Table employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id int,
    dep_name VARCHAR(100)
)

INSERT INTO
    employees
VALUES (1, 'John Doe', 101),
    (2, 'Jane Smith', 102);

INSERT INTO
    departments
VALUES (101, 'Human Resources'),
    (102, 'Marketing');

SELECT * from employees;

SELECT * from departments;

-- CROSS JOIN

SELECT * FROM employees CROSS JOIN departments;

-- NATURAL JOIN
SELECT * FROM employees NATURAL JOIN departments;
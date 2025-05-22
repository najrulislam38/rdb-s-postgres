SELECT * FROM employees JOIN departments USING (department_id);

-- view like js variable, who store data. view kind of 2 categories. 1. Manual, and 2. Non-Manual

-- Non-Manual
CREATE View employees_table as
SELECT *
FROM employees
    JOIN departments USING (department_id);

SELECT * FROM employees_table;

CREATE View dept_avg_salary as
SELECT department_name, avg(salary)
FROM employees_table
GROUP BY
    department_name;

--  drop View dept_avg_salary;

SELECT * FROM dept_avg_salary;

--
CREATE View test_view as (
    SELECT
        employee_name,
        salary,
        department_name
    FROM employees
        JOIN departments using (department_id)
    WHERE
        department_name in (
            SELECT department_name
            from employees
                JOIN departments USING (department_id)
            WHERE
                department_name LIKE '%R%'
        )
);

SELECT * FROM test_view;
SELECT * FROM employees;

INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'Najrul Islam',
        1,
        70000.25,
        '2025-05-20'
    );

EXPLAIN ANALYSE
SELECT employee_name
FROM employees
WHERE
    employee_name = 'Najrul Islam';

CREATE INDEX idx_employees_employee_name on employees (employee_name);

SHOW data_directory;
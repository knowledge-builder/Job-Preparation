-- Count employees per department.

SELECT DISTINCT department_id department,
    COUNT(*) OVER(PARTITION BY department_id) as employee_per_dep
FROM employees
ORDER BY department_id ASC

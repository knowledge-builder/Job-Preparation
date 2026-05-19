-- Count employees per department.

SELECT DISTINCT department_id department,
    COUNT(*) OVER(PARTITION BY department_id) as employee_per_dep
FROM employees
ORDER BY department_id ASC

-- Find average salary per department.

SELECT DISTINCT department_id department, 
    ROUND(AVG(salary) OVER(PARTITION BY department_id), 2) as avg_salary
FROM employees
ORDER BY department_id ASC

-- Count tasks by status.

SELECT DISTINCT task_status, 
    COUNT(task_id) OVER(PARTITION BY task_status) task_count
FROM tasks
ORDER BY task_status ASC

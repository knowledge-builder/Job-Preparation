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

-- Count tasks by priority.

SELECT DISTINCT priority, 
    COUNT(task_id) OVER(PARTITION BY priority) task_count
FROM tasks
ORDER BY task_count DESC

-- Count completed tasks per employee.

SELECT DISTINCT employee_id, 
    COUNT(task_id) OVER(PARTITION BY employee_id) task_count
FROM tasks
WHERE task_status = 'Completed'
ORDER BY task_count DESC

-- Find total salary expense per department.

SELECT DISTINCT department_id, 
    ROUND(SUM(salary) OVER(PARTITION BY department_id), 2) total_salary_expense
FROM employees
ORDER BY total_salary_expense DESC

-- Count employees by status.

SELECT DISTINCT status, 
    COUNT(employee_id) OVER(PARTITION BY status) employee_count
FROM employees
ORDER BY employee_count DESC

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

-- Count tasks created per month.

WITH month AS (
    SELECT TO_CHAR(created_at::timestamp,'FMMonth') AS mnth, task_id
	FROM tasks
	ORDER BY mnth
)

SELECT DISTINCT m.mnth, 
    COUNT(t.task_id) OVER(PARTITION BY m.mnth) task_count
FROM tasks t
JOIN month m
ON t.task_id = m.task_id

--   Find average task completion duration by priority. Hint: Use: completed_at - created_at

WITH duration AS (
    SELECT task_id, completed_at::DATE - created_at::DATE dur
	FROM tasks
)

SELECT DISTINCT t.priority, 
    ROUND(AVG(d.dur) OVER(PARTITION BY t.priority), 2) avg_completion_duration
FROM tasks t
JOIN duration d
ON t.task_id = d.task_id
ORDER BY avg_completion_duration DESC

--   Count completed vs in-progress tasks in ONE query.

SELECT
    DISTINCT task_status,
	COUNT(task_status) task_count
FROM 
    tasks
GROUP BY
    task_status

--   Count HIGH priority completed tasks.

SELECT
    priority,
	task_status,
	COUNT(task_status) task_count
FROM tasks
GROUP BY
    priority, task_status
HAVING	
    priority = 'High'
AND
    task_status = 'Completed'

-- Count completed tasks per employee.

SELECT
    DISTINCT employee_id,
	task_status,
	COUNT(*) task_count
FROM 
    tasks
GROUP BY
    employee_id, task_status
HAVING
    task_status = 'Completed'

-- Calculate completion rate: completed_tasks / total_tasks

SELECT 
    COUNT(*) FILTER (WHERE task_status = 'Completed') completed_tasks,
	COUNT(*) total_tasks,
	CONCAT(
		ROUND(COUNT(*) FILTER (WHERE task_status = 'Completed')::NUMERIC / COUNT(*), 2) * 100, '%') AS completion_rate
FROM
    tasks

-- Count active employees per department.

SELECT
    DISTINCT department_id department,
    COUNT(*) FILTER(WHERE status = 'Active') employee_count
FROM
    employees
GROUP BY
    department_id
ORDER BY
    employee_count DESC

-- Count inactive employees per department.

SELECT
    DISTINCT department_id department,
    COUNT(*) FILTER(WHERE status = 'Inactive') employee_count
FROM
    employees
GROUP BY
    department_id
ORDER BY
    employee_count DESC

-- Count tasks completed in March 2024.

SELECT
    COUNT(*) FILTER (WHERE task_status = 'Completed' AND EXTRACT(MONTH FROM completed_at) = 3) AS completed_tasks
FROM
    tasks

-- Count tasks not yet completed.

SELECT
    COUNT(*) FILTER (WHERE task_status != 'Completed') incomplete_tasks
FROM
    tasks

-- Count HIGH priority tasks still in progress.

SELECT
    COUNT(*) FILTER (WHERE task_status = 'In Progress' AND priority = 'High') high_priority_count
FROM
    tasks

-- Create a KPI summary query containing:
	-- total tasks
	-- completed tasks
	-- in-progress tasks
	-- completion percentage all in ONE query.

WITH calc AS (
	SELECT
	    COUNT(task_id) total_tasks,
		COUNT(*) FILTER (WHERE task_status = 'Completed') completed_tasks,
		COUNT(*) FILTER (WHERE task_status = 'In Progress') in_progress_task
	FROM
	    tasks
)

SELECT 
    total_tasks,
	completed_tasks,
	in_progress_task,
	CONCAT
	(
		ROUND((completed_tasks::NUMERIC / total_tasks), 2) * 100, '%'
	) completion_percentage
FROM
    calc

-- Show employee names with department names.

SELECT 
    employee_name, department_id
FROM 
    employees

-- Show task names with employee names.

SELECT 
    t.task_name, e.employee_name
FROM
    tasks t
JOIN 
	employees e
ON t.employee_id = e.employee_id

-- Show completed tasks with:
	-- employee name
	-- department name

SELECT
    e.employee_name, t.task_status, t.task_name, e.department_id
FROM
    employees e
JOIN
    tasks t
ON  
    e.employee_Id = t.employee_id
WHERE
    t.task_status = 'Completed'

-- Count tasks per department.

SELECT
    e.department_id, COUNT(t.task_id) task_count
FROM
    employees e
JOIN
    tasks t
ON  
    e.employee_id = t.employee_id
GROUP BY
    e.department_id
ORDER BY task_count DESC

-- Find average salary by department name.

SELECT
    department_id, ROUND(AVG(salary), 2) avg_salary_dept
FROM
    employees
GROUP BY 
    department_id
	
-- Show all employees and their task counts. Include employees with zero tasks.

SELECT
	e.employee_name employee,
	COUNT(t.task_id) task_count
FROM employees e
JOIN tasks t
	ON e.employee_id = t.employee_id
GROUP BY employee  
ORDER BY employee




































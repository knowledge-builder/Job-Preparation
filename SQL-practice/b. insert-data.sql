-- Insert Data

-- Departments
INSERT INTO departments (department_name)
VALUES
    ('Operations'),
	('Finance'),
	('Analytics'),
	('HR');


-- Employees
INSERT INTO employees (
    employee_name,
	department_id,
	hire_date,
	salary,
	status
)
VALUES
    ('Alice', 1, '2022-01-10', 55000, 'Active'),
	('Bob', 1, '2021-03-15', 62000, 'Active'),
	('Charlie', 2, '2020-07-01', 70000, 'Active'),
	('Diana', 3, '2023-02-20', 50000, 'Active'),
	('Evan', 3, '2022-09-05', 58000, 'Inactive'),
	('Fiona', 4, '2011-11-11', 52000, 'Active');


-- Tasks
INSERT INTO tasks (
    employee_id, 
	task_name,
	task_status,
	priority,
	created_at,
	completed_at
)
VALUES
	(1, 'Monthly Ops Report', 'Completed', 'High', '2024-01-05', '2024-01-07'),
	(1, 'Workflow Audit', 'Completed', 'Medium', '2024-02-01', '2024-02-03'),
	(2, 'Inventory Validation', 'In Progress', 'High', '2024-02-10', NULL),
	(2, 'Process Review', 'Completed', 'Low', '2024-01-12', '2024-01-20'),
	(3, 'Budget Analysis', 'Completed', 'High', '2024-03-01', '2024-03-04'),
	(4, 'Dashboard QA', 'Completed', 'Medium', '2024-03-05', '2024-03-06'),
	(4, 'Anomaly Detection', 'In Progress', 'High', '2024-03-10', NULL),
	(5, 'Pipeline Validation', 'Completed', 'High', '2024-02-15', '2024-02-18'),
	(6, 'HR Compliance Audit', 'Completed', 'Low', '2024-01-25', '2024-01-28');


-- Tasks logs
INSERT INTO task_logs (
    task_id,
	log_status,
	log_time
)
VALUES
	(1, 'Created', '2024-01-05 09:00'),
	(1, 'Completed', '2024-01-07 17:00'),
	
	(2, 'Created', '2024-02-01 10:00'),
	(2, 'Completed', '2024-02-03 16:00'),
	
	(3, 'Created', '2024-02-10 08:30'),
	
	(4, 'Created', '2024-01-12 11:00'),
	(4, 'Completed', '2024-01-20 15:00'),
	
	(5, 'Created', '2024-03-01 09:15'),
	(5, 'Completed', '2024-03-04 18:00'),
	
	(6, 'Created', '2024-03-05 10:45'),
	(6, 'Completed', '2024-03-06 14:30'),
	
	(7, 'Created', '2024-03-10 08:00'),
	
	(8, 'Created', '2024-02-15 13:00'),
	(8, 'Completed', '2024-02-18 16:00'),
	
	(9, 'Created', '2024-01-25 09:30'),
	(9, 'Completed', '2024-01-28 12:00');

















-- Departments

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(100)
);


-- Employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100),
	department_id INT REFERENCES departments(department_id),
	hire_date DATE,
	salary NUMERIC(10, 2),
	status VARCHAR(20)
);


-- Tasks
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
	employee_id INT REFERENCES employees(employee_id),
	task_name VARCHAR(200),
	task_status VARCHAR(30),
	priority VARCHAR(20),
	created_at TIMESTAMP,
	completed_at TIMESTAMP
);


-- Tasks activity logs
CREATE TABLE task_logs (
    log_id SERIAL PRIMARY KEY,
	task_id INT REFERENCES tasks(task_id),
	log_status VARCHAR(30),
	log_time TIMESTAMP
);

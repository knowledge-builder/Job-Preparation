# Display the first 5 rows of employees.
employees.head(5)

# Show dataset shape for employees.
employees.shape

# List all column names.
employees.columns

# Show data types for all columns.
employees.info()

# Count total employees.
employees['employee_name'].nunique()

# Find average salary.
round(employees['salary'].mean(), 2)

# Find highest salary.
employees['salary'].max()

# Count active employees.
# .shape[0] is a common way to count how many rows are in the dataset.
active_emp = employees[employees['status'] == 'Active'].shape[0]
active_emp

# Find unique departments.
employees['department_id'].unique()

# Count total tasks.
tasks['task_id'].count()

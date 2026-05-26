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

# Count employees per department.

# department_id is the grouping key
# employee_name is the aggregated column

res = employees.groupby('department_id')['employee_name'].count().sort_values(ascending=False)

emp_dep_count = res.rename("employee_count")

emp_dep_count

# Calculate percentage of completed tasks.

completed = tasks[tasks['task_status']=='Completed'].shape[0]

completed_task_pct = (completed / (tasks['task_status'].shape[0])) * 100

print(f"{completed_task_pct:.2f}'%'")

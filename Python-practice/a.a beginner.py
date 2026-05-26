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

# Calculate average salary per department.

res = employees.groupby('department_id')['salary'].mean().sort_values(ascending=False)

avg_salary_dep = res.rename('avg_salary')

avg_salary_dep

# Count tasks by status.

res = tasks.groupby('task_status')['task_id'].count().sort_values(ascending=False)

task_count_status = res.rename('task_count')

task_count_status

# Count tasks by priority.

res = tasks.groupby('priority')['task_id'].count().sort_values(ascending=False)

task_count_prio = res.rename('task_count')

task_count_prio

# Count completed tasks per employee.

res = tasks.groupby('employee_id')['task_id'].count().sort_values(ascending=False)

task_per_emp_count = res.rename('task_count')

task_per_emp_count

# Find total salary expense by department.

res = employees.groupby('department_id')['salary'].sum().sort_values(ascending=False)

total_salary_dep = round(res.rename('total_salary'),2)

total_salary_dep

# Find department with highest average salary.

res = employees.groupby('department_id')['salary'].mean().sort_values(ascending=False)

highest_avgsalary_dep = res.rename('avg_salary')

highest_avgsalary_dep.head(1)

# Count active vs inactive employees.

res = employees.groupby('status')['status'].count().sort_values(ascending=False)

emp_per_stat_count = res.rename('stat_count')

emp_per_stat_count

# Calculate percentage of completed tasks.

completed = tasks[tasks['task_status']=='Completed'].shape[0]

completed_task_pct = (completed / (tasks['task_status'].shape[0])) * 100

print(f"{completed_task_pct:.2f}'%'")

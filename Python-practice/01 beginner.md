
# BEGINNER PRACTICE PROBLEMS

## TOPIC 1 — Basic Data Exploration (10 Problems)

**Problem 1**
Display the first 5 rows of employees.

**Problem 2**
Show dataset shape for employees.

**Problem 3**
List all column names.

**Problem 4**
Show data types for all columns.

**Problem 5**
Count total employees.

**Problem 6**
Find average salary.

**Problem 7**
Find highest salary.

**Problem 8**
Count active employees.

**Problem 9**
Find unique departments.

**Problem 10**
Count total tasks.

---

## TOPIC 2 — Filtering & Selection (10 Problems)

**Problem 1**
Show only ACTIVE employees.

**Problem 2**
Show HIGH priority tasks.

**Problem 3**
Find completed tasks.

**Problem 4**
Show employees in Analytics department.

**Problem 5**
Find employees earning above 55,000.

**Problem 6**
Find incomplete tasks.

**Problem 7**
Show tasks assigned to employee_id = 4.

**Problem 8**
Find LOW priority completed tasks.

**Problem 9**
Filter employees whose names start with "A".

**Problem 10**
Show employees who are NOT active.

---

## TOPIC 3 — Grouping & Aggregations (10 Problems)

**Problem 1**
Count employees per department.

**Problem 2**
Calculate average salary per department.

**Problem 3**
Count tasks by status.

**Problem 4**
Count tasks by priority.

**Problem 5**
Count completed tasks per employee.

**Problem 6**
Find total salary expense by department.

**Problem 7**
Find department with highest average salary.

**Problem 8**
Count active vs inactive employees.

**Problem 9**
Calculate percentage of completed tasks.

**Problem 10**
Find average number of tasks per employee.

---

## TOPIC 4 — Joins & Merging (10 Problems)

Enterprise analytics heavily depends on combining datasets correctly.

**Problem 1**
Merge employees and tasks.

**Problem 2**
Show employee names with task names.

**Problem 3**
Count tasks per employee.

**Problem 4**
Find employees with no tasks.

**Problem 5**
Count completed tasks by department.

**Problem 6**
Find HIGH priority tasks by department.

**Problem 7**
Calculate average salary of employees with completed tasks.

**Problem 8**
Find departments with the most tasks.

**Problem 9**
Create employee productivity summary.
Include:
* employee
* total tasks
* completed tasks

**Problem 10**
Find employees handling HIGH priority work.

---

## TOPIC 5 — Intro Data Validation (10 Problems)

This is VERY important in enterprise analytics.

**Problem 1**
Check for NULL values in all columns.

**Problem 2**
Count duplicate employee records.

**Problem 3**
Validate employee_id uniqueness.

**Problem 4**
Find tasks with missing statuses.

**Problem 5**
Detect invalid priorities.
Expected:
* High
* Medium
* Low

**Problem 6**
Find employees with negative salaries.

**Problem 7**
Detect orphaned task records.
Example: task employee_id does not exist in employees table

**Problem 8**
Validate required columns exist.

**Problem 9**
Check for empty employee names.

**Problem 10**
Build a simple data-quality summary report.
Include:
* null counts
* duplicate counts
* invalid records

---

## ENTERPRISE ANALYTICS MINDSET

In enterprise analytics, Python is often used for:
* validation workflows
* KPI safeguards
* anomaly detection
* reporting QA
* operational monitoring
* pipeline trustworthiness

Interviewers often evaluate:
* reasoning clarity
* validation awareness
* edge-case thinking
* data integrity understanding
* explainability

NOT just:
* syntax memorization

---

## RECOMMENDED PRACTICE APPROACH

For every exercise:

1.  **Explain the Business Goal**
    Example: “This validation ensures reporting completeness.”

2.  **Explain Risks**
    Example: “Duplicate employee IDs could inflate KPI calculations.”

3.  **Explain Assumptions**
    Example: “Inactive employees are excluded from productivity reporting.”

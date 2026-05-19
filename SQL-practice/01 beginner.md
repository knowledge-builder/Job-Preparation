# BASIC SQL PRACTICE PROBLEMS
## Foundation Level — Enterprise Analytics Focus

These exercises simulate:
* operational reporting
* KPI development
* workflow analytics
* productivity tracking
* reporting validation
* enterprise data reasoning

Focus on:
* correctness
* readability
* trustworthy metrics
* business interpretation

---

## TOPIC 1 — Aggregations (10 Problems)

These simulate operational reporting metrics.

**Problem 1**
Find the total number of employees.

**Problem 2**
Find the average salary of all employees.

**Problem 3**
Find the highest salary.

**Problem 4**
Find the lowest salary.

**Problem 5**
Find the total number of tasks.

**Problem 6**
Find the number of completed tasks.

**Problem 7**
Find the average salary of ACTIVE employees only.

**Problem 8**
Find the total number of HIGH priority tasks.

**Problem 9**
Find the earliest employee hire date.

**Problem 10**
Find the latest task creation date.

---

## TOPIC 2 — GROUP BY (10 Problems)

Enterprise reporting relies heavily on grouped metrics.

**Problem 1**
Count employees per department.

**Problem 2**
Find average salary per department.

**Problem 3**
Count tasks by status.

**Problem 4**
Count tasks by priority.

**Problem 5**
Count completed tasks per employee.

**Problem 6**
Find total salary expense per department.

**Problem 7**
Count employees by status.

**Problem 8**
Find earliest hire date per department.

**Problem 9**
Count tasks created per month.

**Problem 10**
Find average task completion duration by priority.
*Hint: Use: completed_at - created_at*

---

## TOPIC 3 — Conditional Aggregation (10 Problems)

This is VERY common in enterprise KPI reporting.

**Problem 1**
Count completed vs in-progress tasks in ONE query.

**Problem 2**
Count HIGH priority completed tasks.

**Problem 3**
Count completed tasks per employee.

**Problem 4**
Calculate completion rate: completed_tasks / total_tasks

**Problem 5**
Count active employees per department.

**Problem 6**
Count inactive employees per department.

**Problem 7**
Count tasks completed in March 2024.

**Problem 8**
Count tasks not yet completed.

**Problem 9**
Count HIGH priority tasks still in progress.

**Problem 10**
Create a KPI summary query containing:
* total tasks
* completed tasks
* in-progress tasks
* completion percentage
all in ONE query.

---

## TOPIC 4 — Basic JOINS (10 Problems)

This is critical for enterprise analytics.

**Problem 1**
Show employee names with department names.

**Problem 2**
Show task names with employee names.

**Problem 3**
Show completed tasks with:
* employee name
* department name

**Problem 4**
Count tasks per department.

**Problem 5**
Find average salary by department name.

**Problem 6**
Show all employees and their task counts. Include employees with zero tasks.

**Problem 7**
Show employees with NO completed tasks.

**Problem 8**
Find departments with more than 2 employees.

**Problem 9**
Show all task logs with task names.

**Problem 10**
Find employees who worked on HIGH priority tasks.

---

## TOPIC 5 — Monthly Trend Analysis (10 Problems)

VERY enterprise-style analytics work.

**Problem 1**
Count tasks created each month.

**Problem 2**
Count tasks completed each month.

**Problem 3**
Calculate monthly completion rate.

**Problem 4**
Find average completion duration per month.

**Problem 5**
Count HIGH priority tasks per month.

**Problem 6**
Find month-over-month task growth.

**Problem 7**
Identify the busiest month by task creation volume.

**Problem 8**
Count unique employees creating tasks each month.

**Problem 9**
Find monthly department productivity.
Example metrics:
* completed tasks
* total tasks
* completion rate

**Problem 10**
Create a monthly KPI dashboard query containing:
* total tasks
* completed tasks
* average completion time
* HIGH priority task count
grouped by month.

---

## HOW TO PRACTICE LIKE AN ENTERPRISE ANALYST

For EACH problem:

**Step 1 — Write the SQL**
Do not look up answers immediately.

**Step 2 — Validate the Result**
Ask:
* Does the number make sense?
* Are NULLs affecting results?
* Are joins duplicating rows?
* Is aggregation correct?

**Step 3 — Explain the Business Meaning**
Example: “This metric helps measure operational throughput.” or: “This KPI tracks workflow completion efficiency.”

**Step 4 — Explain Risks / Assumptions**
Example: “Tasks without completed_at timestamps are excluded from completion duration calculations.”

This is enterprise analytics thinking.

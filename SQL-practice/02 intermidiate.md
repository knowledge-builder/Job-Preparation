# INTERMEDIATE SQL ANALYTICS PRACTICE
## Enterprise Reporting & Operational Analytics

### Overview

This section moves beyond foundational SQL and focuses on intermediate enterprise analytics skills commonly evaluated in operational reporting environments.

The emphasis is on:

* KPI accuracy
* workflow analysis
* operational trend detection
* trustworthy aggregations
* reporting logic
* business interpretation
* analytical reasoning

These exercises simulate real-world enterprise analytics tasks involving:

* productivity reporting
* operational monitoring
* process analysis
* performance tracking
* data validation awareness

### Core Intermediate SQL Topics

This section introduces:

* Window Functions
* Common Table Expressions (CTEs)
* Advanced Aggregations
* Multi-table KPI Reporting
* Trend Analysis
* Ranking & Productivity Metrics
* Operational Workflow Analytics
* Reporting Validation Logic

---

### TOPIC 1 — Intermediate Aggregations (10 Problems)

These focus on operational KPI reasoning and multi-level analytics.

**Problem 1**
Find the percentage of completed tasks.

**Problem 2**
Find the percentage of HIGH priority tasks.

**Problem 3**
Calculate average task completion time in days.

**Problem 4**
Find the department with the highest average salary.

**Problem 5**
Find the employee with the most completed tasks.

**Problem 6**
Calculate total completed tasks by department.

**Problem 7**
Find departments where average salary exceeds 55,000.

**Problem 8**
Calculate the average number of tasks per employee.

**Problem 9**
Find the month with the highest number of completed tasks.

**Problem 10**
Calculate completion percentage by department.

---

### TOPIC 2 — Intermediate JOINS (10 Problems)

Focus on operational reporting and relationship analysis.

**Problem 1**
Show all employees and their departments, including employees without departments.

**Problem 2**
Show all departments and total task counts. Include departments with zero tasks.

**Problem 3**
Find employees who never created tasks.

**Problem 4**
Find tasks without completion logs.

**Problem 5**
Show each employee with:
* total tasks
* completed tasks
* in-progress tasks

**Problem 6**
Find departments where no HIGH priority tasks exist.

**Problem 7**
Show task completion durations with employee names.

**Problem 8**
Find employees whose completed tasks exceed department average.

**Problem 9**
Find employees who worked on tasks across multiple months.

**Problem 10**
Find the department contributing the highest number of completed tasks.

---

### TOPIC 3 — Common Table Expressions (CTEs) (10 Problems)

CTEs are extremely common in enterprise analytics workflows.

**Problem 1**
Use a CTE to calculate completed tasks per employee.

**Problem 2**
Use a CTE to identify employees with more than 1 completed task.

**Problem 3**
Create a monthly task summary using a CTE.

**Problem 4**
Use a CTE to calculate completion rates by department.

**Problem 5**
Use multiple CTEs to calculate:
* total tasks
* completed tasks
* completion percentage
by department.

**Problem 6**
Use a CTE to identify overdue/incomplete workflows.
Assume: tasks older than 7 days not completed are overdue.

**Problem 7**
Use a CTE to rank departments by task volume.

**Problem 8**
Create a reusable KPI summary CTE. Include:
* total tasks
* completed tasks
* avg completion time

**Problem 9**
Use a CTE to identify task anomalies: NULL completion dates marked as Completed.

**Problem 10**
Build a workflow-state summary using CTEs. Include:
* Created
* Completed
* In Progress
* Completion %

---

### TOPIC 4 — Window Functions (10 Problems)

Window functions are heavily used in enterprise reporting systems.

**Problem 1**
Rank employees by salary. Use: RANK()

**Problem 2**
Assign row numbers to tasks ordered by creation date. Use: ROW_NUMBER()

**Problem 3**
Calculate running total of tasks created over time.

**Problem 4**
Find salary difference from department average.

**Problem 5**
Calculate cumulative completed tasks by month.

**Problem 6**
Find highest-paid employee per department.

**Problem 7**
Calculate moving average of task volume.

**Problem 8**
Find previous month's task count using: LAG()

**Problem 9**
Calculate month-over-month task growth percentage.

**Problem 10**
Identify top-performing employees using window ranking functions.
Metrics:
* completed tasks
* completion speed
* task volume

---

### TOPIC 5 — Operational KPI Analytics (10 Problems)

These simulate enterprise operational reporting environments.

**Problem 1**
Create a productivity dashboard query. Include:
* employee
* completed tasks
* avg completion duration
* high priority tasks handled

**Problem 2**
Identify workflow bottlenecks.
Hint: Find tasks with longest completion durations.

**Problem 3**
Calculate department efficiency scores.
Example: completed_tasks / total_tasks

**Problem 4**
Identify employees handling the highest percentage of HIGH priority work.

**Problem 5**
Create a monthly operational KPI dashboard. Include:
* total tasks
* completion %
* avg duration
* employee participation

**Problem 6**
Detect reporting anomalies. Examples:
* completed tasks with NULL completion dates
* duplicate workflow states
* inconsistent statuses

**Problem 7**
Identify departments with declining productivity trends.

**Problem 8**
Find employees with unusually high workloads.

**Problem 9**
Create a workflow aging report. Example:
* tasks open > 3 days
* tasks open > 7 days
* tasks open > 30 days

**Problem 10**
Build a comprehensive operational reporting query combining:
* joins
* aggregations
* CTEs
* window functions
* KPI calculations

---

### Enterprise Analytics Interview Focus

At this level, interviewers often evaluate:

* reporting trustworthiness
* operational reasoning
* analytical clarity
* KPI correctness
* ability to explain transformations
* anomaly awareness
* workflow understanding
* validation thinking

### Recommended Practice Method

For every query:

1. **Explain the Business Purpose**
   Example: “This query measures operational throughput by department.”

2. **Explain Assumptions**
   Example: “Tasks without completion dates are excluded from duration calculations.”

3. **Explain Risks**
   Example: “Duplicate task logs could inflate workflow metrics.”

4. **Validate Results**
   Always ask:
   * Are joins duplicating rows?
   * Are NULLs affecting metrics?
   * Are percentages mathematically correct?
   * Is aggregation happening at the correct grain?

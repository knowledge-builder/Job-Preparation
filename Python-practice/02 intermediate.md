# INTERMEDIATE PYTHON DATA ANALYTICS
## Enterprise Validation & Operational Analytics

### Overview

This section moves beyond beginner pandas operations and focuses on intermediate enterprise analytics workflows.

The emphasis is on:
* operational reporting logic
* data validation pipelines
* KPI calculations
* anomaly detection
* workflow analytics
* reporting trustworthiness
* analytical reasoning

These exercises simulate real enterprise analytics environments involving:
* reporting QA
* workflow monitoring
* operational dashboards
* productivity analytics
* validation safeguards
* analytics engineering support

### Core Intermediate Topics

This section introduces:
* Advanced DataFrame transformations
* Grouped KPI analytics
* Multi-dataset validation
* Workflow anomaly detection
* Reporting QA logic
* Time-series analytics
* Data-quality pipelines
* Enterprise validation thinking

---

### SECTION 1 — Intermediate Data Transformation

**Focus Areas**
* complex filtering
* calculated fields
* conditional logic
* derived KPIs
* operational metrics
* transformation reasoning

#### TOPIC 1 — Advanced Filtering & Transformations (10 Problems)

**Problem 1**
Create a new column: completion_flag where: 1 = Completed, 0 = Not Completed.

**Problem 2**
Create a task duration estimate column. Assume: High priority = 3 days, Medium = 5 days, Low = 7 days.

**Problem 3**
Standardize all department names to uppercase.

**Problem 4**
Create a salary band column: Low, Medium, High, based on salary ranges.

**Problem 5**
Create a workload category: Light, Moderate, Heavy, based on employee task counts.

**Problem 6**
Extract only completed HIGH priority tasks.

**Problem 7**
Create a productivity score: completed tasks * 10.

**Problem 8**
Create a boolean anomaly flag for: inactive employees with active tasks.

**Problem 9**
Normalize employee names to lowercase.

**Problem 10**
Build a reusable transformation pipeline function.

---

### TOPIC 2 — Intermediate Grouping & KPI Analytics (10 Problems)

These simulate operational reporting workflows.

**Problem 1**
Calculate completion percentage by department.

**Problem 2**
Find employees with above-average task volume.

**Problem 3**
Calculate workload distribution percentages.

**Problem 4**
Find departments contributing most HIGH priority work.

**Problem 5**
Build employee productivity rankings.

**Problem 6**
Calculate average tasks per active employee.

**Problem 7**
Identify departments with declining completion rates.

**Problem 8**
Calculate cumulative task counts.

**Problem 9**
Create monthly KPI summaries. Include: total tasks, completed tasks, completion %.

**Problem 10**
Build an operational dashboard DataFrame.

---

### TOPIC 3 — Joins, Merges & Relational Validation (10 Problems)

This mirrors enterprise analytics engineering workflows.

**Problem 1**
Perform LEFT JOIN validation between employees and tasks.

**Problem 2**
Identify orphaned task records.

**Problem 3**
Validate referential integrity.

**Problem 4**
Merge datasets and detect duplicate inflation.

**Problem 5**
Find employees with no completed tasks.

**Problem 6**
Detect duplicate task assignments.

**Problem 7**
Create department-level operational summaries.

**Problem 8**
Build workflow-state summary tables.

**Problem 9**
Find mismatches between: expected workloads, actual workloads.

**Problem 10**
Create reusable merge-validation utilities.

---

### TOPIC 4 — Intermediate Data Validation & QA (10 Problems)

This is heavily evaluated in enterprise analytics environments.

**Problem 1**
Create a NULL analysis report for all datasets.

**Problem 2**
Build duplicate detection logic.

**Problem 3**
Validate schema consistency. Expected: required columns, expected data types.

**Problem 4**
Create invalid-status detection logic.

**Problem 5**
Detect impossible business conditions. Examples: negative salaries, missing task statuses, invalid priorities.

**Problem 6**
Create data completeness metrics.

**Problem 7**
Build workflow consistency checks. Examples: Completed tasks missing completion info, In Progress tasks incorrectly closed.

**Problem 8**
Create anomaly summary reports.

**Problem 9**
Build automated validation functions.

**Problem 10**
Create a reusable enterprise QA validation pipeline.

---

### TOPIC 5 — Time-Series & Workflow Analytics (10 Problems)

Enterprise reporting frequently involves time-based analysis.

**Problem 1**
Convert task dates to datetime format.

**Problem 2**
Extract: month, quarter, year, from task dates.

**Problem 3**
Calculate monthly task volume.

**Problem 4**
Calculate rolling averages for task completion.

**Problem 5**
Detect workload spikes over time.

**Problem 6**
Calculate month-over-month growth.

**Problem 7**
Build cumulative productivity metrics.

**Problem 8**
Identify busiest operational periods.

**Problem 9**
Build operational trend dashboards.

**Problem 10**
Create workflow aging analytics. Examples: tasks open > 3 days, tasks open > 7 days, tasks open > 30 days.

---

### ENTERPRISE ANALYTICS INTERVIEW FOCUS

At intermediate levels, interviewers often evaluate:
* validation reasoning
* KPI correctness
* operational awareness
* anomaly thinking
* workflow interpretation
* reporting trustworthiness
* explainability
* transformation logic clarity

---

### RECOMMENDED PRACTICE METHOD

For each exercise:

1.  **Explain the Business Goal**
    Example: “This transformation supports operational productivity reporting.”

2.  **Explain Validation Risks**
    Example: “Incorrect joins could inflate task counts.”

3.  **Explain Assumptions**
    Example: “Inactive employees should not receive new task assignments.”

4.  **Validate Outputs**
    Always check: row counts, duplicate inflation, NULL behavior, KPI correctness, merge integrity.

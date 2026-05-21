# Senior Data Analyst SQL Assessment Reconstruction

## Assessment Summary

The assessment simulated a real-world analytics workflow involving:

- Multi-table joins
- KPI derivation
- Aggregation
- Window functions
- Ranking
- Percentage distribution
- Data grain awareness

The assessment was not primarily about advanced SQL syntax.

It was testing:
- Analytical structuring
- Transformation sequencing
- Understanding row grain
- KPI correctness
- Ability to work under time pressure

---

# Reconstructed Database Schema

## consultants

```sql
consultant_id
consultant_name
```

---

## projects

```sql
project_id
project_area
budget_hours
```

---

## time_entries

```sql
entry_id
consultant_id
project_id
hours_spent
entry_date
```

---

# Assessment Tasks

## Task 1 — Get Consultant Names

Expected skill:
- Basic JOIN

```sql
SELECT
    c.consultant_name
FROM consultants c
JOIN time_entries t
    ON c.consultant_id = t.consultant_id;
```

---

# Task 2 — Get Project Area

Expected skill:
- Multi-table JOIN

```sql
SELECT
    c.consultant_name,
    p.project_area
FROM time_entries t
JOIN consultants c
    ON t.consultant_id = c.consultant_id
JOIN projects p
    ON t.project_id = p.project_id;
```

---

# Task 3 — Calculate Percentage of Hours Spent

Formula:

```text
(hours_spent / budget_hours) * 100
```

Expected skill:
- Derived columns
- Numeric calculations
- Avoid integer division

---

## Correct Solution

```sql
SELECT
    c.consultant_name,
    p.project_area,

    ROUND(
        SUM(t.hours_spent) * 100.0 / p.budget_hours,
        2
    ) AS pct_hours

FROM time_entries t

JOIN consultants c
    ON t.consultant_id = c.consultant_id

JOIN projects p
    ON t.project_id = p.project_id

GROUP BY
    c.consultant_name,
    p.project_area,
    p.budget_hours;
```

---

# Task 4 — Rank Consultants Per Project Area

Expected skill:
- Window functions
- RANK()
- PARTITION BY

---

## Correct Solution

```sql
RANK() OVER (
    PARTITION BY project_area
    ORDER BY total_hours_spent DESC
)
```

---

# Full Assessment Reconstruction

```sql
WITH consultant_project_hours AS (

    SELECT
        c.consultant_name,
        p.project_area,
        p.budget_hours,

        SUM(t.hours_spent) AS total_hours_spent

    FROM time_entries t

    JOIN consultants c
        ON t.consultant_id = c.consultant_id

    JOIN projects p
        ON t.project_id = p.project_id

    GROUP BY
        c.consultant_name,
        p.project_area,
        p.budget_hours
),

final AS (

    SELECT
        consultant_name,
        project_area,
        total_hours_spent,
        budget_hours,

        ROUND(
            total_hours_spent * 100.0 / budget_hours,
            2
        ) AS pct_hours,

        RANK() OVER (
            PARTITION BY project_area
            ORDER BY total_hours_spent DESC
        ) AS consultant_rank

    FROM consultant_project_hours
)

SELECT
    consultant_name,
    project_area,

    CONCAT(pct_hours, '%') AS percentage_hours,

    consultant_rank

FROM final

ORDER BY
    project_area,
    consultant_rank;
```

---

# Skills Required To Pass This Assessment

## 1. JOIN Fundamentals

You must understand:
- INNER JOIN
- LEFT JOIN
- Join keys
- Row multiplication risks

Mental model:

```text
JOIN changes row state
```

Key question:

```text
"What does one row represent after this join?"
```

---

# 2. Aggregation

You must understand:
- SUM()
- COUNT()
- AVG()
- GROUP BY

Mental model:

```text
many rows -> fewer grouped rows
```

---

# 3. Derived KPI Calculations

You must understand:
- Ratios
- Percentages
- Integer division issues

Common pattern:

```sql
metric * 100.0 / denominator
```

NOT:

```sql
metric * 100 / denominator
```

---

# 4. Window Functions

Critical topic.

You must understand:
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- OVER()
- PARTITION BY

Mental model:

```text
Preserve rows while calculating across rows
```

---

# 5. Data Grain Awareness

This is one of the most important senior-level concepts.

You must constantly ask:

```text
"What does one row represent right now?"
```

Examples:

```text
Raw rows
→ consultant-project rows
→ aggregated consultant-project metrics
→ ranked consultant-project KPIs
```

---

# 6. Query Structuring

You should learn:
- CTEs
- Layered transformations
- Separating aggregation from ranking

Good SQL is:
- readable
- modular
- debuggable

---

# Why Time Pressure Became Difficult

The difficulty was likely NOT SQL knowledge.

The actual challenge was:

## 1. Unfamiliar Sandbox Environment

You were forced to:
- learn UI
- understand execution flow
- understand editor behavior
- manage navigation

while solving logic problems.

---

## 2. Cognitive Context Switching

You were simultaneously:
- recalling SQL
- understanding schema
- navigating tools
- debugging syntax

This increases cognitive load significantly.

---

# How To Improve For Time-Bound SQL Assessments

## 1. Learn SQL Templates

Do NOT solve from scratch every time.

Memorize reusable patterns.

---

## JOIN Template

```sql
SELECT
FROM a
JOIN b
    ON a.id = b.id
```

---

## Aggregation Template

```sql
SELECT
    key,
    SUM(metric)
FROM t
GROUP BY key
```

---

## Window Function Template

```sql
RANK() OVER (
    PARTITION BY group_col
    ORDER BY metric DESC
)
```

---

## CTE Template

```sql
WITH base AS (

),

final AS (

)

SELECT *
FROM final;
```

---

# 2. Practice Query Sequencing

Think in states:

```text
FROM
→ JOIN
→ WHERE
→ GROUP BY
→ HAVING
→ WINDOW FUNCTION
→ SELECT
→ ORDER BY
```

---

# 3. Learn To Identify Grain Immediately

Fast analysts instantly determine:

```text
"What does one row represent?"
```

This prevents:
- duplicate metrics
- incorrect aggregation
- ranking bugs

---

# 4. Practice Under Timers

Practice:
- 15-minute SQL problems
- 30-minute case drills

Focus:
- speed of structuring
- not memorization

---

# 5. Separate Logic From Syntax

When solving:

First think:

```text
What transformations are needed?
```

Then translate into SQL.

NOT:
- typing immediately
- hoping syntax reveals logic

---

# Recommended Practice Topics

Priority order:

## Critical
- JOINs
- GROUP BY
- HAVING
- Window Functions
- CTEs

## Important
- NULL handling
- CASE WHEN
- Subqueries
- Date filtering

## Advanced
- Recursive CTEs
- Performance optimization
- Query execution plans

---

# Final Insight

This assessment was fundamentally testing:

```text
State transformations over relational data
```

Specifically:

```text
raw events
→ enriched entities
→ grouped metrics
→ derived KPIs
→ ranked outputs
```

That is the core mental model behind enterprise analytics engineering and senior data analysis work.

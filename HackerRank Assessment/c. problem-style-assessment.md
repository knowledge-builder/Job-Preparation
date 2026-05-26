```
Generate a HackerRank-style coding assessment problem.

The problem should be realistic and interview-level, focused on one of the following themes:
- Pandas data manipulation (filtering, grouping, aggregation, transforms)
- SQL analytics (JOINs, GROUP BY, window functions, CTEs, rolling calculations)
- Time-series or rolling window computations (e.g., 7-day moving average)
- Frequency counting or text processing

The problem must include:

1. Problem Statement
- Clear business scenario (finance, users, transactions, analytics, etc.)
- Specific goal (what to compute)

2. Input Format
- For Python: sample lists / DataFrame structure
- For SQL: table schema with column types

3. Output Format
- Exact expected output columns or return type

4. Sample Input Data
- Small realistic dataset (5–15 rows max)

5. Sample Output
- Correct result based on sample input

6. Constraints (if applicable)
- Size limits, data types, edge cases

7. Difficulty level: Medium

IMPORTANT:
- The problem should NOT be trivial
- It should require at least one of:
  - GROUP BY + JOIN
  - window function OR self-join rolling logic
  - filtering with conditions
  - date/time reasoning
- Avoid directly stating the solution approach

Make it similar in style to HackerRank / LeetCode SQL & DataFrame challenges.
```
---
```
==================== PYTHON / PANDAS ====================

1. DataFrame Basics
- Create DataFrame from lists/dicts
- Understand Series vs DataFrame outputs

2. Boolean Filtering
- df[condition]
- .str.contains()
- Negation: ~condition

3. GroupBy & Aggregation
- groupby()
- sum(), mean(), count()
- Understand collapse vs row-preserving outputs

4. Transform vs Aggregate (CRITICAL)
- aggregate → reduces rows
- transform → keeps original shape

5. String Operations
- .str.contains()
- .str.len()
- type casting: astype(str)

6. Frequency Counting
- dict.get(key, 0) + 1
- preserving order of first occurrence
- set() for duplicates

=========================================================

======================= SQL ==============================

1. JOIN Basics
- INNER JOIN on keys
- Multi-table aggregation

2. GROUP BY Rules
- Non-aggregated columns must be grouped
- COUNT, SUM, AVG usage

3. Date Filtering
- BETWEEN dates (preferred)
- EXTRACT(MONTH FROM date)
- Avoid DB-specific MONTH() confusion

4. Window Functions (CORE)
- SUM()/AVG() OVER (...)
- ROWS BETWEEN (row-based window)
- RANGE BETWEEN (value/date-based window)

5. Self-Joins (Rolling Windows fallback)
- JOIN table ON date BETWEEN current_date - INTERVAL '6 day' AND current_date

6. CTEs (WITH clause)
- Break queries into steps
- Pre-aggregate before window logic

7. Moving/Rolling Calculations
- 7-day sums and averages
- Time-series aggregation logic
- Handling missing dates implicitly

=========================================================

==================== CORE SKILLS ========================

- Understand data shape changes (raw → grouped → windowed)
- Choose correct tool (groupby vs transform vs window vs join)
- Time-based reasoning (rolling windows)
- SQL vs Pandas mental mapping
=========================================================
```

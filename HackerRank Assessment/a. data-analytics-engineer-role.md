# Data Analytics Engineer Assessment Preparation Guide
## Revolut / HackerRank Style SQL + Python Assessment

---

# Assessment Mental Model

This assessment is NOT primarily about:

• LeetCode-style algorithms  
• Advanced computer science theory  
• Memorizing syntax

It IS primarily about:

• Data reasoning  
• Business analytics  
• Fast schema understanding  
• Data transformation  
• Aggregation logic  
• Validation and anomaly detection  
• Writing correct logic under time pressure

---

# SECTION 1 — SQL Concepts

# 1. Understanding Relational Data

You must quickly identify:

• Primary keys  
• Foreign keys  
• One-to-many relationships  
• Many-to-one relationships  
• Transaction tables vs dimension tables

Example schema:

```sql
users
------
user_id
signup_date
country

subscriptions
-------------
subscription_id
user_id
plan_type
start_date
status

transactions
------------
transaction_id
user_id
amount
status
transaction_date
```

Expected understanding:

• One user can have many transactions  
• One user can have many subscriptions  
• Transactions are event records  
• Users are dimension/master records

---

# 2. JOINS

## Concepts

### INNER JOIN
Only matching records.

### LEFT JOIN
Keep all rows from left table.

### RIGHT JOIN
Keep all rows from right table.

### FULL OUTER JOIN
Keep all rows from both sides.

---

## Problems You May Solve

### Example Problems

• Find users with no transactions  
• Find subscriptions without users  
• Find total revenue per country  
• Match consultants to projects  
• Match employees to timesheets

---

## Example Query

```sql
SELECT
    u.user_id,
    COUNT(t.transaction_id) AS total_transactions
FROM users u
LEFT JOIN transactions t
    ON u.user_id = t.user_id
GROUP BY u.user_id;
```

---

# 3. GROUP BY + AGGREGATIONS

## Concepts

• COUNT()
• SUM()
• AVG()
• MIN()
• MAX()

---

## Problems You May Solve

• Total revenue by country  
• Average transaction amount  
• Total hours worked per consultant  
• Number of active users  
• Monthly subscription count

---

## Example Query

```sql
SELECT
    country,
    SUM(amount) AS revenue
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
GROUP BY country;
```

---

# 4. CASE WHEN

## Concepts

Conditional categorization.

---

## Problems You May Solve

• Categorize users as active/inactive  
• Flag failed transactions  
• Create revenue tiers  
• Mark late payments

---

## Example Query

```sql
SELECT
    user_id,
    amount,
    CASE
        WHEN amount >= 1000 THEN 'high'
        WHEN amount >= 500 THEN 'medium'
        ELSE 'low'
    END AS spending_tier
FROM transactions;
```

---

# 5. HAVING

## Concepts

Filter aggregated results.

---

## Problems You May Solve

• Users with more than 10 transactions  
• Consultants with > 40 hours worked  
• Countries with high churn

---

## Example Query

```sql
SELECT
    user_id,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY user_id
HAVING COUNT(*) > 10;
```

---

# 6. SUBQUERIES

## Concepts

Nested queries.

---

## Problems You May Solve

• Users above average spending  
• Projects with max hours  
• Top-performing consultants

---

## Example Query

```sql
SELECT *
FROM transactions
WHERE amount > (
    SELECT AVG(amount)
    FROM transactions
);
```

---

# 7. COMMON TABLE EXPRESSIONS (CTEs)

## Concepts

Break complex logic into steps.

---

## Problems You May Solve

• Multi-stage aggregations  
• Funnel analysis  
• Retention calculations  
• Revenue trends

---

## Example Query

```sql
WITH user_totals AS (
    SELECT
        user_id,
        SUM(amount) AS total_spent
    FROM transactions
    GROUP BY user_id
)

SELECT *
FROM user_totals
WHERE total_spent > 1000;
```

---

# 8. WINDOW FUNCTIONS (VERY IMPORTANT)

# HIGH PRIORITY TOPIC

---

## Concepts

### ROW_NUMBER()
Assign row order.

### RANK()
Ranking with ties.

### DENSE_RANK()
Dense ranking.

### LAG()
Previous row value.

### LEAD()
Next row value.

### SUM() OVER()
Running totals.

---

## Problems You May Solve

• Latest transaction per user  
• Top spender per country  
• Running revenue totals  
• Retention calculations  
• Detect consecutive failures  
• Compare current vs previous month

---

## Example Query

```sql
SELECT
    user_id,
    transaction_date,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY transaction_date DESC
    ) AS rn
FROM transactions;
```

---

# 9. DATE/TIME ANALYSIS

## Concepts

• DATE_TRUNC()
• EXTRACT()
• INTERVAL
• Monthly grouping

---

## Problems You May Solve

• Monthly revenue  
• Daily active users  
• Retention cohorts  
• Week-over-week growth

---

## Example Query

```sql
SELECT
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(amount) AS revenue
FROM transactions
GROUP BY month;
```

---

# 10. DATA QUALITY / VALIDATION

# HIGHLY LIKELY

---

## Problems You May Solve

### Duplicate Detection

```sql
SELECT
    transaction_id,
    COUNT(*)
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;
```

---

### Missing Values

```sql
SELECT *
FROM users
WHERE country IS NULL;
```

---

### Orphan Records

```sql
SELECT t.*
FROM transactions t
LEFT JOIN users u
    ON t.user_id = u.user_id
WHERE u.user_id IS NULL;
```

---

# SECTION 2 — PYTHON CONCEPTS

# Assessment Philosophy

The Python section is usually:

• Data manipulation focused  
• ETL-style logic  
• Transformation oriented  
• Business-data oriented

NOT:

• Graph algorithms  
• Dynamic programming  
• Competitive programming

---

# 1. LISTS

## Concepts

• Iteration  
• Filtering  
• Appending  
• Sorting

---

## Problems You May Solve

• Filter failed transactions  
• Extract active users  
• Sort records by revenue

---

## Example

```python
transactions = [
    {"amount": 100},
    {"amount": 500}
]

high_value = [
    t for t in transactions
    if t["amount"] > 200
]
```

---

# 2. DICTIONARIES

# VERY IMPORTANT

---

## Concepts

• Key-value storage  
• Frequency counting  
• Aggregation maps

---

## Problems You May Solve

• Revenue per user  
• Count failed payments  
• Group transactions

---

## Example

```python
totals = {}

for t in transactions:
    user_id = t["user_id"]

    if user_id not in totals:
        totals[user_id] = 0

    totals[user_id] += t["amount"]
```

---

# 3. SETS

## Concepts

• Deduplication  
• Membership checking

---

## Problems You May Solve

• Detect duplicate users  
• Unique transaction IDs

---

## Example

```python
seen = set()

for transaction in transactions:
    transaction_id = transaction["transaction_id"]

    if transaction_id in seen:
        print("duplicate")

    seen.add(transaction_id)
```

---

# 4. FUNCTIONS

## Concepts

• Reusable logic  
• Data transformation pipelines

---

## Problems You May Solve

• Validation functions  
• Aggregation functions  
• Cleaning functions

---

## Example

```python
def is_valid_transaction(transaction):
    return transaction["amount"] > 0
```

---

# 5. FILE + DATA PROCESSING

## Concepts

• Reading structured data  
• Parsing records  
• Iterating datasets

---

## Problems You May Solve

• CSV processing  
• JSON transformation  
• Transaction parsing

---

# 6. AGGREGATION LOGIC

# HIGH PRIORITY

---

## Problems You May Solve

• Revenue totals  
• Average transaction size  
• User activity metrics  
• Failure rates

---

## Example

```python
total = 0

for transaction in transactions:
    total += transaction["amount"]
```

---

# 7. GROUPING DATA

# VERY IMPORTANT

---

## Problems You May Solve

• Transactions by user  
• Orders by country  
• Sessions by day

---

## Example

```python
grouped = {}

for transaction in transactions:
    user_id = transaction["user_id"]

    if user_id not in grouped:
        grouped[user_id] = []

    grouped[user_id].append(transaction)
```

---

# 8. DATA VALIDATION

# VERY LIKELY

---

## Problems You May Solve

• Invalid amounts  
• Duplicate records  
• Missing fields  
• Negative values  
• Bad timestamps

---

## Example

```python
def validate(transaction):
    required_fields = [
        "user_id",
        "amount",
        "status"
    ]

    for field in required_fields:
        if field not in transaction:
            return False

    return True
```

---

# 9. SORTING + RANKING

## Problems You May Solve

• Top spenders  
• Highest revenue countries  
• Most active consultants

---

## Example

```python
sorted_users = sorted(
    users,
    key=lambda x: x["revenue"],
    reverse=True
)
```

---

# 10. COMMON ASSESSMENT PATTERNS

# SQL Patterns

## Pattern 1 — Funnel Analysis

Example:

• signed_up  
→ activated  
→ subscribed  
→ retained

---

## Pattern 2 — Retention

Example:

• users active after 30 days

---

## Pattern 3 — Revenue Metrics

Example:

• monthly recurring revenue  
• average revenue per user

---

## Pattern 4 — Data Validation

Example:

• duplicate transactions  
• invalid timestamps

---

# Python Patterns

## Pattern 1 — ETL Transformation

Input:

```python
[
    {"user_id": 1, "amount": 100}
]
```

Output:

```python
{
    1: 100
}
```

---

## Pattern 2 — Grouping + Aggregation

Example:

• group all transactions per user

---

## Pattern 3 — Validation Pipeline

Example:

• reject malformed records

---

## Pattern 4 — Event Analysis

Example:

• count failures per user

---

# SECTION 3 — Time Pressure Strategy

# 1. Read Schema First

Immediately identify:

• primary keys  
• foreign keys  
• event tables  
• dimension tables

---

# 2. Solve Incrementally

Do NOT write giant queries immediately.

Instead:

• build small queries  
• validate intermediate outputs  
• add complexity gradually

---

# 3. Use CTEs Aggressively

Cleaner logic:
• easier debugging  
• easier reading  
• lower mental load

---

# 4. Validate Assumptions

Check:

• duplicates  
• nulls  
• row counts

---

# 5. Prioritize Correctness Over Cleverness

Avoid:
• over-optimization  
• overly compact code  
• complex one-liners

---

# SECTION 4 — Mock Problems You Should Practice

# SQL Problems

## Easy

• Total transactions per user  
• Average revenue by country  
• Users with no subscriptions

---

## Medium

• Latest transaction per user  
• Monthly revenue growth  
• Running revenue totals  
• Failed payment percentage

---

## Hard

• Retention analysis  
• Funnel conversion rates  
• Consecutive failed transactions  
• Top spender per month

---

# Python Problems

## Easy

• Count transaction totals  
• Filter invalid records  
• Remove duplicates

---

## Medium

• Group transactions by user  
• Compute monthly summaries  
• Generate ranking outputs

---

## Hard

• Mini ETL pipeline  
• Validation framework  
• Detect anomalies  
• Sessionization/event grouping

---

# FINAL PREPARATION PRIORITY

# Highest ROI SQL Topics

1. JOINS  
2. GROUP BY  
3. CTEs  
4. WINDOW FUNCTIONS  
5. DATE ANALYSIS  
6. DATA VALIDATION

---

# Highest ROI Python Topics

1. Dictionaries  
2. Grouping logic  
3. Aggregation  
4. Validation pipelines  
5. Sorting/ranking  
6. Data transformations

---

# Final Advice

The assessment is primarily testing:

• Can you think clearly under pressure?  
• Can you reason about relational data?  
• Can you transform messy data into useful information?  
• Can you detect inconsistencies and edge cases?  
• Can you write clean, understandable logic quickly?

Optimize for:

• clarity  
• correctness  
• decomposition  
• practical business reasoning

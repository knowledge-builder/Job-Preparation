```
SQL Logic Flow (Rank Aggregated Customers)

1. Define output grain
  • Decide what one row represents (e.g., one row per customer per country)

2. Filter data early
  • Apply conditions such as:
    • status = 'success'
    • date range (e.g., March 2024)

3. Join necessary tables
  • Combine required datasets:
    • customers
    • transactions

4. Aggregate to correct level
  • GROUP BY:
    • country
    • customer_id
    • full_name
  • Compute measures:
    • SUM(amount) AS total_amount (per customer)

5. Apply window function
  • Use RANK() or DENSE_RANK()
  • PARTITION BY country
  • ORDER BY total_amount DESC

6. Final select
  • Return only required output columns
  • Exclude raw transaction-level fields

Key rule
  • Filter → Join → Aggregate → Rank → Select
```
---
```sql
WITH cx_rank AS (

    SELECT

        l.customer_id,  
        -- ❌ SHOULD STAY (but only field needed from loans table)
        -- Keeps customer identity for aggregation
        -- No issue here

        l.loan_id,  
        -- ❌ SHOULD BE REMOVED
        -- Problem: introduces loan-level grain → splits one customer into multiple rows
        -- Replacement: REMOVE (aggregation should be at customer_id level only)

        r.loan_id,  
        -- ❌ SHOULD BE REMOVED
        -- Problem: duplicate join key, already used in ON clause
        -- Adds unnecessary grouping dimension and breaks customer-level aggregation
        -- Replacement: REMOVE

        SUM(r.repayment_amount) total_repaid_amount,  
        -- ⚠️ LOGIC DEPENDS ON GROUPING
        -- Problem: currently sums per (customer + loan), not per customer
        -- Replacement: keep, BUT only after fixing GROUP BY to customer_id only

        r.repayment_status  
        -- ❌ SHOULD BE REMOVED
        -- Problem: already filtered in WHERE clause (repayment_status = 'success')
        -- Adds artificial grouping dimension and fragments aggregation
        -- Replacement: REMOVE

    FROM loans l

    JOIN repayments r
        ON l.loan_id = r.loan_id  
        -- ✅ CORRECT JOIN
        -- Maintains relationship between loans and repayments

    WHERE r.repayment_status = 'success'  
        -- ✅ CORRECT FILTER
        -- Ensures only successful repayments are considered

        AND r.repayment_date >= DATE '2024-01-01'  
        -- ⚠️ PARTIALLY OK
        -- Prefer full boundary-safe range for Q1 consistency

        AND r.repayment_date < DATE '2024-03-31'  
        -- ❌ SHOULD BE CHANGED
        -- Problem: excludes 2024-03-31
        -- Replacement: < DATE '2024-04-01'

    GROUP BY

        l.customer_id,  
        -- ⚠️ CORRECT TARGET FIELD
        -- This should be the ONLY grouping key needed

        l.loan_id,  
        -- ❌ SHOULD BE REMOVED
        -- Problem: changes grain from customer-level → loan-level
        -- Causes duplicated customers across multiple loans

        r.loan_id,  
        -- ❌ SHOULD BE REMOVED
        -- Redundant with JOIN condition; no analytical value

        r.repayment_status  
        -- ❌ SHOULD BE REMOVED
        -- Already fixed by WHERE clause; does not define grouping logic
)

SELECT

    c1.customer_id,  
    -- ✅ CORRECT: final required dimension

    c1.full_name,  
    -- ✅ CORRECT: descriptive attribute

    c1.region,  
    -- ✅ CORRECT: used for partitioning ranking

    c2.total_repaid_amount,  
    -- ⚠️ DEPENDENT ON INCORRECT CTE GRAIN
    -- Value is inflated/split due to incorrect aggregation upstream

    RANK() OVER (
        PARTITION BY c1.region  
        -- ✅ CORRECT: ranking resets per region

        ORDER BY c2.total_repaid_amount DESC  
        -- ⚠️ CORRECT LOGIC, BUT BASE DATA IS WRONG
    ) performer_rank

FROM cx c1

JOIN cx_rank c2
    ON c1.customer_id = c2.customer_id  
    -- ⚠️ CORRECT JOIN, BUT FINAL RESULT DEPENDS ON WRONG AGGREGATION GRAIN
```

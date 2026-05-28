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
````

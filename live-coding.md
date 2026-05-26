```
• Important Notes

  • There are intentional edge cases:
    • customers with failed transactions
    • canceled subscriptions
    • multiple transaction types
    • varying transaction frequencies
    • high-value customers
    • missing activity days
    • NULL end dates

• Your Challenge

  • Invent and solve:
    • 4 interview-style business questions

  • Try to include:
    • at least one window function
    • at least one rolling calculation
    • at least one ranking problem
    • at least one multi-table aggregation
    • at least one business insight query

• Difficulty Targets

  • A strong interviewer could ask things like:
    • rolling 7-day spend
    • top customer per country
    • failed transaction rate
    • revenue growth
    • churn indicators
    • first/last transaction analysis
    • active subscription logic
    • cumulative revenue
    • ranking within groups
    • month-over-month metrics

• Extra Twist (Very Realistic)

  • During the interview:
    • explain assumptions
    • inspect tables first
    • validate row counts
    • think aloud
    • build queries incrementally

  • That’s exactly what they’ll evaluate.

• Deliverables

  • Once you solve your own questions, send:
    • the problem statement
    • your SQL solution
    • your reasoning

  • I’ll then act like the interviewer and:
    • critique your SQL
    • point out edge cases
    • ask follow-ups
    • suggest optimizations
    • challenge your business logic
```
<br>

---

```
• Question 1 — Customer Revenue Ranking

  • The finance team wants to identify the company’s highest-value customers.

  • For each country, rank customers based on their total successful transaction amount in March 2024.

  • Requirements
    • Only include status = 'success'
    • Include:
      • country
      • customer_id
      • full_name
      • total_successful_amount
      • customer_rank
    • Ranking should restart per country
    • Highest total amount should receive rank 1
    • If two customers tie, they should receive the same rank

  • Expected Concepts
    • JOIN
    • GROUP BY
    • window function
    • ranking logic


• Question 2 — Rolling 7-Day Transaction Analysis

  • The risk team wants to monitor short-term spikes in transaction activity.

  • For each customer transaction:
    • calculate the rolling 7-day successful transaction total
    • based on the transaction date

  • Requirements
    • Only include successful transactions
    • Include:
      • customer_id
      • transaction_date
      • amount
      • rolling_7_day_total
    • The rolling window should include:
      • current row
      • previous 6 calendar days
    • Results should be ordered by:
      • customer_id
      • transaction_date

  • Expected Concepts
    • window functions OR self-join rolling logic
    • date reasoning
    • cumulative calculations

  • Rolling Concept

    • Rolling Total(t)

      • = Σ from d = t − 6 to t of x(d)


• Question 3 — Subscription Churn Risk Analysis

  • The subscriptions team wants to identify potentially disengaged customers.

  • Find customers who:
    • currently have an active subscription
    • but have not made a successful transaction in the last 10 days of available transaction data

  • Requirements
    • Assume the latest transaction date in the dataset represents “today”
    • Active subscription means:
      • end_date IS NULL
      • OR end_date > latest transaction date
    • Include:
      • customer_id
      • full_name
      • plan_name
      • latest_successful_transaction_date
      • days_since_last_success

  • Expected Concepts
    • CTEs
    • date arithmetic
    • filtering logic
    • aggregation
    • business reasoning

  • Days-Since Concept

    • Days Since Last Activity
      • = Current Date − Last Activity Date


• Question 4 — Failed Transaction Rate by Transaction Type

  • The operations team wants to identify which transaction types are most error-prone.

  • For each transaction type:
    • calculate:
      • total transaction count
      • failed transaction count
      • failed transaction percentage

  • Requirements
    • Include:
      • transaction_type
      • total_transactions
      • failed_transactions
      • failed_percentage
    • Round percentage to 2 decimal places
    • Sort from highest failed percentage to lowest

  • Expected Concepts
    • conditional aggregation
    • CASE WHEN
    • percentage calculations
    • grouping
    • numeric formatting

  • Failure-Rate Concept

    • Failure Rate
      • = (Failed Transactions / Total Transactions) × 100
```

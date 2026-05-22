# 🧠 Data Analytics Engineer Assessment Scenario  
## Finance Transaction Monitoring System (Revolut-style)

---

## 📌 Overview

You are working as a **Data Analytics Engineer** in a fintech company similar to Revolut.

The company processes millions of financial transactions daily across multiple products:
- Card payments
- FX conversions
- Bank transfers
- Subscription fees

Your responsibility is to ensure:
- Data accuracy
- Revenue correctness
- System reliability
- Detection of anomalies in financial metrics

---

## ⚠️ Business Problem

The finance team reports:

> “Daily revenue is unstable and sometimes drops unexpectedly.”

However, engineering teams report:

> “No system issues detected.”

You are assigned to investigate the discrepancy using data.

---

## 📊 Data Model

### 1. Transactions Table

| Column          | Type   | Description |
|-----------------|--------|-------------|
| transaction_id  | string | Unique transaction identifier |
| user_id         | string | Customer identifier |
| amount          | float  | Transaction value |
| currency        | string | Currency code (e.g. USD, EUR) |
| status          | string | Transaction status (success, failed, reversed) |
| created_at      | date   | Transaction timestamp |

---

### 2. Users Table

| Column        | Type   | Description |
|---------------|--------|-------------|
| user_id       | string | Unique user identifier |
| country       | string | User country |
| signup_date   | date   | User registration date |

---

### 3. FX Rates Table

| Column        | Type   | Description |
|---------------|--------|-------------|
| currency      | string | Currency code |
| rate_to_usd   | float  | Conversion rate to USD |

---

## 💰 Revenue Definition

- Revenue = SUM(successful transactions converted to USD)

## 💰 Business Rules

- Only successful transactions are included in revenue
- Failed transactions are excluded
- Reversed transactions must be deducted
- All amounts must be converted to USD using FX rates

---

## 🎯 Objectives

### 1. Revenue Validation

You must ensure:

- Revenue is correctly computed
- FX conversion logic is accurate
- Reversed transactions are deducted properly
- No double counting occurs
- Only valid transactions are included

---

### 2. Anomaly Detection

You must detect:

- Sudden drops in revenue
- Sudden spikes in revenue
- Unusual transaction patterns
- Abnormal user behavior
- Currency-specific inconsistencies

---

### 3. Data Aggregation

You must compute:

- Daily revenue
- Revenue per user
- Revenue per country
- Revenue per currency
- Top users by revenue

---

### 4. Data Quality Checks

You must validate:

- Missing FX rates
- Missing user references
- Invalid transaction statuses
- Inconsistent timestamps
- Duplicated transaction IDs

---

### 5. Business Investigation

You must help answer:

- Why did revenue drop on certain days?
- Which segment caused the change?
- Is it user behavior or system issue?
- Is it currency-specific or global?

---

## 🧪 Python Tasks (Q1–Q10)

### Q1. Revenue Calculation Engine
Compute total revenue in USD:
- only successful transactions
- apply FX conversion

---

### Q2. Filter Invalid Transactions
Remove:
- failed transactions
- reversed transactions

Return cleaned dataset.

---

### Q3. Revenue per User
Aggregate total revenue per user.

---

### Q4. Currency Conversion
Convert all transaction amounts into USD using FX rates.

---

### Q5. Anomaly Detection
Flag users whose revenue is:
- > 2 standard deviations above mean

---

### Q6. Daily Revenue
Compute revenue grouped by date.

---

### Q7. High Failure Rate Users
Find users with:
- failure rate > 50%

---

### Q8. Top Revenue Users
Return top 10 users by revenue.

---

### Q9. Reversal Transaction Handling
Ensure reversed transactions reduce revenue correctly.

---

### Q10. Data Quality Validation
Check for:

- Missing FX rates
- Missing users
- Invalid statuses
- Inconsistent data

---

## 🧾 SQL Tasks (Q1–Q10)

### Q1. Daily Revenue
Compute total revenue per day in USD.

---

### Q2. Revenue by Country
Join users table → compute revenue per country.

---

### Q3. Top 5 Users by Revenue
Rank users based on total revenue.

---

### Q4. Failure Rate per User
Compute:

- failed transactions / total transactions

---

### Q5. Currency Breakdown
Compute revenue contribution per currency.

---

### Q6. Missing FX Detection
Find currencies not present in FX table.

---

### Q7. 7-Day Moving Average Revenue
Compute rolling average revenue using window functions.

---

### Q8. Users with No Successful Transactions
Identify users who never had a successful transaction.

---

### Q9. Revenue Drop Detection
Compare daily revenue with previous day using LAG().

---

### Q10. High Risk Users
Identify users with:

- high failure rate
- high reversal rate
- abnormal transaction behavior

---

## 🧠 Skills Tested

### SQL Skills
- Joins
- Aggregations
- Window functions
- Cohort/time-based analysis
- Ranking logic

### Python Skills
- Data transformation
- Filtering logic
- Aggregation
- Business rule implementation
- Anomaly detection logic

### Analytics Engineering Skills
- Data validation
- Metric correctness
- Pipeline thinking
- Business logic translation
- System reliability reasoning

---

## 🚀 Key Takeaway

This scenario simulates real-world fintech analytics engineering work:

> Transforming raw financial transaction data into reliable, validated, and explainable business metrics used for decision-making.

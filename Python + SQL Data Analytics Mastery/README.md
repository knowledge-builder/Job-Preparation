# Python + SQL Data Analytics Mastery Blueprint

## Purpose

This document is not designed merely to help you pass coding assessments.

It is designed to help you:

* Think like a professional analyst or analytics engineer
* Understand how data systems behave
* Reason about datasets as state transitions
* Build reliable analytical logic
* Understand why queries and transformations work
* Become capable of solving unfamiliar business problems

This roadmap focuses heavily on:

* SQL
* Python
* Pandas
* Analytical reasoning
* Data transformation systems
* Time-series logic
* Granularity and invariants
* Production-oriented thinking

The goal is not memorization.

The goal is:

> Internalizing the mental model behind data systems.

---

# SECTION 1 — Core Mental Model

Before tools, syntax, or frameworks, understand this:

## Data Analytics Is State Transformation

Every dataset represents a state.

Every query or transformation changes that state.

Example:

Raw Transactions
→ Filter valid transactions
→ Aggregate daily revenue
→ Compute rolling averages
→ Rank top merchants
→ Produce business metric

At each step:

* Row count changes
* Granularity changes
* Meaning changes
* Constraints change
* Invariants change

Strong analysts track these changes mentally.

Weak analysts only memorize syntax.

---

# SECTION 2 — SQL Mastery

SQL is the foundation of analytics.

You should aim to become:

* Comfortable writing complex analytical queries
* Able to reason about query execution
* Able to debug incorrect metrics
* Able to design reliable transformations

---

# SQL Phase 1 — Foundational Querying

## Core Concepts

Learn:

* SELECT
* FROM
* WHERE
* ORDER BY
* LIMIT
* DISTINCT
* Aliases
* Basic expressions

Understand:

* SQL is declarative
* You describe desired output state
* The database determines execution strategy

Important mental model:

A query transforms tables into new tables.

---

## Filtering

Learn:

* WHERE
* AND / OR
* IN
* BETWEEN
* LIKE
* IS NULL
* NOT NULL

Understand:

Filtering removes rows from a dataset state.

You must reason about:

* Which rows survive
* Which rows disappear
* Whether filtering occurs before or after aggregation

---

## Sorting

Learn:

* ORDER BY
* ASC / DESC
* Multi-column ordering

Understand:

Sorting does not change values.

It changes presentation order.

---

# SQL Phase 2 — Aggregation & Granularity

This is one of the most important sections.

---

## GROUP BY

Learn:

* COUNT
* SUM
* AVG
* MIN
* MAX
* GROUP BY
* HAVING

Critical concept:

Aggregation changes granularity.

Example:

Transaction-level data:

transaction_id | customer_id | amount

Grouped by customer:

customer_id | total_spend

You collapsed many rows into one row per customer.

This is a state transition.

---

## Granularity

You must always know:

> What does one row represent?

Examples:

* One transaction
* One customer
* One product-day
* One merchant-month

Most analytical mistakes come from losing track of granularity.

---

## HAVING

Difference:

* WHERE filters rows before grouping
* HAVING filters groups after aggregation

This distinction matters deeply.

---

# SQL Phase 3 — JOINs

This is another core competency.

---

## JOIN Types

Learn:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* CROSS JOIN

Understand:

JOINs combine dataset states.

You must reason about:

* Cardinality
* Duplication
* Missing matches
* Row explosion

---

## Cardinality

Learn relationship types:

* One-to-one
* One-to-many
* Many-to-many

Most production metric bugs come from:

* Duplicate multiplication
* Incorrect joins
* Uncontrolled cardinality expansion

---

## Anti-Joins

Learn:

* LEFT JOIN + IS NULL
* NOT EXISTS

Used for:

* Missing transactions
* Unmatched records
* Fraud detection
* Data validation

---

# SQL Phase 4 — Window Functions

This is one of the most important advanced skills.

---

## Core Window Functions

Learn:

* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* SUM() OVER
* AVG() OVER
* COUNT() OVER
* LAG()
* LEAD()
* FIRST_VALUE()
* LAST_VALUE()

Understand:

Window functions preserve rows.

Unlike GROUP BY:

* Aggregation collapses rows
* Windows compute across related rows while preserving shape

This is a critical mental model.

---

## PARTITION BY

Understand:

Partitions define independent analytical state groups.

Example:

Revenue ranking per merchant.

Each merchant becomes an isolated analytical partition.

---

## ORDER BY Inside Windows

This defines sequence.

Sequence matters for:

* Running totals
* Moving averages
* Previous-row logic
* Temporal reasoning

---

## ROWS BETWEEN

Learn rolling windows:

* 7-day moving average
* Rolling sums
* Running balances
* Trend smoothing

Critical concept:

Window frame defines analytical visibility.

---

# SQL Phase 5 — CTEs & Query Decomposition

Learn:

* WITH clauses
* Multi-step transformations
* Query decomposition

Example:

Step 1:
Filter valid transactions

Step 2:
Aggregate daily revenue

Step 3:
Compute rolling averages

Step 4:
Rank merchants

CTEs help you model transformations explicitly.

This aligns perfectly with state-driven thinking.

---

# SQL Phase 6 — Time-Series Analytics

This is heavily used in production analytics.

---

## Date Functions

Learn:

* DATE_TRUNC
* EXTRACT
* INTERVAL
* CURRENT_DATE
* DATE arithmetic

Understand:

Time introduces sequence and continuity.

---

## Rolling Metrics

Learn:

* Moving averages
* Running totals
* Period comparisons
* Retention windows
* DAU / WAU / MAU

These are core business analytics metrics.

---

## Cohort Analysis

Learn:

* First purchase date
* Retention cohorts
* Monthly retention
* Repeat purchase behavior

Important for:

* SaaS
* E-commerce
* Fintech
* Subscription systems

---

# SQL Phase 7 — Data Cleaning & Reliability

This separates beginners from professionals.

---

## NULL Handling

Learn:

* COALESCE
* NULLIF
* CASE WHEN
* IS NULL

Understand:

NULL represents unknown state.

Not zero.
Not empty.
Not false.

---

## Deduplication

Learn:

* ROW_NUMBER() for latest records
* DISTINCT
* De-duplicating event streams

Production data is messy.

Duplicates are common.

---

## Data Validation

Learn to detect:

* Missing rows
* Invalid joins
* Duplicate records
* Impossible values
* Referential integrity issues

---

# SQL Phase 8 — Query Performance & Internals

Most analysts stop at syntax.

Professionals understand execution.

---

## Learn About

* Indexes
* Query plans
* Partitioning
* Clustering
* Predicate pushdown
* Join strategies
* Scan costs

Understand:

Databases are execution engines.

Your query becomes a physical execution plan.

---

# SECTION 3 — Python Mastery

Python complements SQL.

SQL is best for:

* large-scale aggregation
* joins
* warehouse computation

Python is best for:

* custom logic
* automation
* validation
* modeling
* orchestration
* advanced transformations

---

# Python Phase 1 — Core Language Foundations

Do not skip this.

You must deeply understand:

* Variables
* References
* Functions
* Scope
* Control flow
* Loops
* Conditions
* Data structures

---

## Data Structures

Master:

* list
* tuple
* dict
* set

Understand:

* mutability
* lookup cost
* insertion behavior
* ordering
* uniqueness

---

## Functions

Learn:

* parameters
* return values
* pure functions
* side effects
* closures
* lambda functions

Important:

Functions are state transformers.

---

## Error Handling

Learn:

* try/except
* exception propagation
* validation
* defensive programming

Production systems fail.

Reliable code handles failure.

---

# Python Phase 2 — Memory & State Thinking

This is important for deep understanding.

Learn:

* stack vs heap
* object references
* mutation
* copying
* shallow vs deep copy

Understand:

Variables hold references to objects.

This affects:

* mutation behavior
* function calls
* state persistence

---

# Python Phase 3 — File & Data Processing

Learn:

* reading CSVs
* JSON processing
* parsing text
* file iteration
* generators

Understand:

Large datasets require streaming and memory awareness.

---

# Python Phase 4 — Pandas Mastery

Pandas is the primary Python analytics library.

---

## DataFrame Fundamentals

Master:

* DataFrame creation
* column selection
* row filtering
* indexing
* sorting
* assignment

Understand:

A DataFrame is a tabular state container.

Operations transform dataset states.

---

## Filtering

Learn:

* boolean masks
* multiple conditions
* string filtering
* null filtering

---

## GroupBy

Learn:

* groupby()
* aggregate()
* transform()
* apply()

Critical distinction:

aggregate:

* changes shape
* collapses rows

transform:

* preserves shape
* broadcasts grouped results back

This distinction is extremely important.

---

## Merge & Join

Learn:

* merge()
* join()
* concat()

Understand:

Same cardinality risks exist in Pandas as in SQL.

---

## Time-Series in Pandas

Learn:

* datetime parsing
* rolling()
* resample()
* shift()
* cumulative metrics

Used heavily in analytics.

---

## Missing Data

Learn:

* isna()
* fillna()
* dropna()

Understand:

Missing data changes metric meaning.

---

# Python Phase 5 — Algorithmic Data Reasoning

You do NOT need advanced competitive programming.

But you should understand:

* hashing
* frequency counting
* deduplication
* sorting
* searching
* sliding windows
* maps/dictionaries

These appear frequently in:

* event processing
* log analysis
* behavioral analytics

---

# SECTION 4 — Analytical Thinking

This is the real differentiator.

---

# Metrics Thinking

Learn to ask:

* What does this metric actually mean?
* What rows should count?
* What is the grain?
* What defines an active user?
* What counts as revenue?
* Gross or net?
* Refunded or non-refunded?

Strong analysts think about semantics.

---

# Invariants

Learn to identify:

* What must always remain true?

Examples:

* Total revenue cannot be negative
* Customer IDs must exist
* Transaction timestamps must be ordered
* Deduplicated IDs must be unique

This is foundational for reliable analytics.

---

# Debugging Metrics

Learn to debug:

* Why numbers changed
* Why counts doubled
* Why rows disappeared
* Why joins exploded
* Why windows shifted incorrectly

This is real analyst work.

---

# SECTION 5 — Production Analytics Engineering Concepts

You do not need to become a full data engineer.

But you should understand the ecosystem.

---

# Data Warehouses

Learn basics of:

* BigQuery
* Snowflake
* Redshift
* Databricks

Understand:

Warehouses are analytical execution engines.

---

# ETL / ELT

Learn:

* ingestion
* transformation
* loading
* orchestration
* validation

Modern systems are mostly ELT.

---

# Orchestration

Learn basics of:

* Apache Airflow
* DAGs
* scheduling
* dependencies
* retries
* failure handling

---

# Data Modeling

Learn:

* fact tables
* dimension tables
* star schema
* surrogate keys
* slowly changing dimensions

Important for scalable analytics.

---

# SECTION 6 — Business Domain Knowledge

Different industries emphasize different metrics.

---

# E-Commerce

Learn:

* GMV
* AOV
* conversion rate
* repeat customers
* cohort retention
* refunds
* cart abandonment

---

# Finance / Banking

Learn:

* transaction flows
* balances
* fraud indicators
* risk scoring
* rolling averages
* account activity

---

# SaaS

Learn:

* DAU/WAU/MAU
* churn
* retention
* funnels
* subscriptions
* ARR/MRR

---

# Marketing Analytics

Learn:

* attribution
* CAC
* ROAS
* campaign analytics
* funnel analysis

---

# SECTION 7 — Recommended Project Progression

Projects are critical.

You internalize concepts through system construction.

---

# Project 1 — Transaction Analytics

Build:

* revenue metrics
* customer metrics
* category analytics
* refunds
* rolling averages

Skills:

* joins
* groupby
* windows
* time-series

---

# Project 2 — Event Analytics System

Simulate:

* user events
* sessions
* clickstreams
* active users

Skills:

* deduplication
* sessionization
* sequence logic

---

# Project 3 — Fraud Detection Pipeline

Build:

* suspicious transaction detection
* rolling thresholds
* anomaly logic

Skills:

* window functions
* rolling calculations
* behavioral analysis

---

# Project 4 — Data Validation Framework

Build:

* null checks
* duplicate detection
* schema validation
* reconciliation reports

This teaches production reliability.

---

# SECTION 8 — Interview Preparation vs Professional Mastery

Interview success requires:

* writing correct queries quickly
* recognizing patterns
* understanding windows
* aggregation logic
* joins

Professional mastery requires:

* debugging production data
* reasoning about state
* designing reliable systems
* understanding metric semantics
* handling ambiguity
* validating correctness

Do not optimize purely for assessments.

Optimize for:

* reasoning ability
* system understanding
* analytical clarity

---

# SECTION 9 — How to Practice Effectively

Avoid passive learning.

Do not just:

* watch tutorials
* memorize syntax
* copy solutions

Instead:

1. Predict outputs before running code
2. Explain transformations verbally
3. Track granularity at every step
4. Debug intentionally broken queries
5. Rebuild metrics from scratch
6. Analyze why mistakes happen
7. Compare SQL and Pandas equivalents

---

# SECTION 10 — SQL ↔ Pandas Mental Mapping

Learn equivalent concepts.

SQL WHERE
↔
Pandas boolean filtering

GROUP BY
↔
groupby().agg()

Window functions
↔
transform(), rolling(), shift()

JOIN
↔
merge()

CTE
↔
intermediate DataFrames

Understanding these mappings deepens your analytical flexibility.

---

# SECTION 11 — What “Proficient” Actually Means

You are becoming proficient when:

* You can solve unfamiliar problems
* You understand why transformations work
* You reason about granularity automatically
* You detect analytical mistakes intuitively
* You can decompose complex problems
* You can explain metric logic clearly
* You can debug incorrect outputs systematically

Not when:

* You memorize syntax
* You copy solutions
* You rely blindly on libraries

---

# SECTION 12 — Final Recommended Learning Order

## Stage 1 — Core SQL + Python

Learn:

* SQL basics
* Python basics
* filtering
* aggregation
* joins
* dictionaries/lists

---

## Stage 2 — Intermediate Analytics

Learn:

* window functions
* Pandas
* rolling metrics
* time-series
* merge logic
* deduplication

---

## Stage 3 — Production Thinking

Learn:

* validation
* null handling
* data modeling
* Airflow basics
* warehouse concepts
* performance reasoning

---

## Stage 4 — Advanced Analytical Thinking

Learn:

* metric semantics
* cohort analysis
* system-level debugging
* business logic reasoning
* analytical invariants

---

# Final Principle

The strongest analysts do not think in syntax first.

They think in:

* states
* transitions
* granularity
* invariants
* temporal behavior
* data semantics

SQL and Python are simply tools used to express those transformations.

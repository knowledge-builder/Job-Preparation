-- TASK: Calculate completion rate: completed_tasks / total_tasks
-- Original Query
WITH calc AS (
    SELECT
        DISTINCT
            (
                SELECT COUNT(task_name)
                FROM tasks
            ) AS total_tasks,

            (
                SELECT COUNT(task_status)
                FROM tasks
                WHERE task_status = 'Completed'
            ) AS completed_tasks
    FROM tasks
)

SELECT
    completed_tasks,
    total_tasks,
    (completed_tasks / total_tasks) AS completion_rate
FROM calc;


-- Why did completion_rate return 0?
--
-- Both completed_tasks and total_tasks are BIGINT values.
-- SQL performs INTEGER DIVISION when dividing integers,
-- which removes/truncates the decimal portion.
--
-- Example:
-- 7 / 9 = 0
--
-- To get the correct decimal result, one of the values
-- must be cast to NUMERIC or DECIMAL.
--
-- Example:
-- completed_tasks::numeric / total_tasks
--
--
-- Why is the original approach too lengthy?
--
-- The query uses:
-- 1. Multiple subqueries
-- 2. DISTINCT unnecessarily
-- 3. A CTE for simple aggregate calculations
--
-- This makes the query more verbose and harder to read.
--
-- A cleaner approach is to use FILTER inside aggregate functions,
-- which allows conditional counting directly in COUNT().
--
-- Example:
-- COUNT(*) FILTER (WHERE task_status = 'Completed')
--
-- This removes the need for separate subqueries
-- and simplifies the entire query.


-- Simplified Version
SELECT
    COUNT(*) FILTER (WHERE task_status = 'Completed') AS completed_tasks,
    COUNT(*) AS total_tasks,
    COUNT(*) FILTER (WHERE task_status = 'Completed')::numeric
        / COUNT(*) AS completion_rate
FROM tasks;

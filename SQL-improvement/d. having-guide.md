```
When do we apply HAVING?

• Use HAVING when you want to filter aggregated results
  • It applies after GROUP BY has been computed

• Use HAVING for conditions on:
  • SUM()
  • COUNT()
  • AVG()
  • MIN()
  • MAX()
  • Any derived aggregate metric

• Typical use cases:
  • Keep only customers with total_spent > 1000
  • Keep regions with COUNT(customer_id) >= 50
  • Filter groups based on AVG(order_value)

• Example logic:
  • GROUP BY customer_id
  • HAVING SUM(amount) > 1000


Key distinction

• WHERE filters rows before aggregation
• HAVING filters groups after aggregation


When NOT to use HAVING

• Filtering raw column values
  • status = 'success'
  • country = 'PH'

• Pre-aggregation filters (these belong in WHERE)


Key rule

• WHERE = row-level filtering (before grouping)
• HAVING = group-level filtering (after aggregation)


Fast test

• Can I write it without an aggregate function?
  • YES → use WHERE
  • NO → use HAVING
```

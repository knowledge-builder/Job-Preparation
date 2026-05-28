```
What SHOULD be in GROUP BY

• Columns that define the final row level (grain)
  • These answer: “one row = what?”

• Primary entity identifiers
  • customer_id
  • loan_id
  • region
  • country
  • DATE(transaction_date) (if doing daily aggregation)

• Dimensions you want results split by
  • region (for region-level ranking)
  • country (for country-level ranking)

• Any non-aggregated column appearing in SELECT


What should NOT be in GROUP BY

• Join keys not part of final grain
  • loan_id (if aggregating to customer level)

• Filter-only columns (handled in WHERE clause)
  • status
  • type
  • category (if fixed in filter)

• Raw transaction identifiers
  • transaction_id
  • repayment_id

• Redundant join-related columns not part of output grain

• Constant values
  • e.g. 'success'

• Columns used only for filtering


Key rule
• Include only columns that define “uniqueness of output row”


Fast test
• Remove the column → does meaning of a row change?

• YES → keep in GROUP BY
• NO → remove it
```

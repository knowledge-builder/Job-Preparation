import pandas as pd
import numpy as np

employees = pd.DataFrame({
    "employee_id": [1, 2, 3, 4, 5, 6],
    "employee_name": ["Alice", "Bob", "Charlie", "Diana", "Evan", "Fiona"],
    "department": ["Operations", "Operations", "Finance", "Analytics", "Analytics", "HR"],
    "salary": [55000, 62000, 70000, 50000, 58000, 52000],
    "status": ["Active", "Active", "Active", "Active", "Inactive", "Active"]
})


tasks = pd.DataFrame({
    "task_id": [101, 102, 103, 104, 105, 106, 107, 108, 109],
    "employee_id": [1, 1, 2, 2, 3, 4, 4, 5, 6],
    "task_name": [
        "Monthly Ops Report",
        "Workflow Audit",
        "Inventory Validation",
        "Process Review",
        "Budget Analysis",
        "Dashboard QA",
        "Anomaly Detection",
        "Pipeline Validation",
        "HR Compliance Audit"
    ],
    "task_status": [
        "Completed",
        "Completed",
        "In Progress",
        "Completed",
        "Completed",
        "Completed",
        "In Progress",
        "Completed",
        "Completed"
    ],
    "priority": [
        "High",
        "Medium",
        "High",
        "Low",
        "High",
        "Medium",
        "High",
        "High",
        "Low"
    ]
})

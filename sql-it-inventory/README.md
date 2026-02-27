# SQL IT Inventory Project

This project models a small IT asset tracking system, focusing on relational database design, inventory reporting, and analysis-ready data. It demonstrates how IT assets, users, departments, and maintenance logs can be tracked and queried for operational insights.

---

## Project Overview

The system includes:

- **Departments** — Organizational units managing users and assets  
- **Users** — Staff assigned to assets, optionally linked to departments  
- **Devices** — Laptops, servers, printers with status, assignment, and purchase date  
- **Maintenance Logs** — Records of maintenance events per device  

The database is fully synthetic but simulates realistic scenarios, including overdue maintenance, users with multiple devices, and devices with missing maintenance history.

---

## Schema

- **departments**: `department_id` (PK), `name`, `location`  
- **users**: `user_id` (PK), `username`, `full_name`, `email`, `department_id` (FK)  
- **devices**: `device_id` (PK), `asset_tag`, `device_type`, `model`, `purchase_date`, `status`, `assigned_user_id` (FK)  
- **maintenance_logs**: `log_id` (PK), `device_id` (FK), `maintenance_date`, `description`, `performed_by`  

Constraints enforce **data integrity** (primary keys, foreign keys, `CHECK` for status).

---

## Seed Data Highlights

- ~15 users, ~30 devices, 5 departments  
- Some users with **multiple devices**  
- Some devices with **no maintenance logs**  
- Some devices with **overdue maintenance (>180 days)**  
- Variety of statuses (`active`, `maintenance`, `retired`)  

**Edge Case Example:**  
```sql
-- User with multiple devices
user_id 16, 'sam.t', assigned two laptops

-- Device with no maintenance logs
device_id 33, 'LT-1029', assigned to user 3
These edge cases allow queries to detect anomalies and aggregate correctly, which is central for data analysis.
```
---

## Example Queries

The queries.sql file includes operational queries such as:

1. Devices per Department — Shows inventory distribution
2. Devices Not Maintained in 180 Days — Highlights overdue assets
3. Users with Multiple Devices — Detects high-asset users
4. Devices Under Warranty — Identifies assets within 3-year coverage
5. Maintenance History per Device — Full maintenance reporting
6. Count Devices by Status — Quick operational summary

All queries are commented for clarity and demonstrate aggregation, joins, and date-based filtering.

---

## How to Use

1. Create database (e.g., SQLite):

sqlite3 it_inventory.db < schema.sql
sqlite3 it_inventory.db < seed_data.sql

2. Run queries:

sqlite3 it_inventory.db < queries.sql

3. Review query results to perform operational insights such as:

* Identifying devices overdue for maintenance

* Finding users with many assets

* Summarizing devices by department or status

---

## Future Improvements

- **Add warranty expiration tracking**  
  Introduce a `warranty_end_date` field to more accurately track coverage rather than inferring from purchase date.

- **Enhanced reporting & dashboards**  
  Integrate SQL queries with visualization tools (e.g., Power BI, Tableau, or Python dashboards) for real-time insights.

- **Automated maintenance alerts**  
  Trigger notifications for devices approaching overdue maintenance, supporting proactive asset management.

- **User role and permissions modeling**  
  Expand schema to include roles (admin, technician, regular user) and access controls for security-focused analysis.

- **Historical tracking of device assignments**  
  Maintain a history table for device reassignments, supporting trend analysis and asset auditing.

- **Additional edge cases for analytics**  
  Include shared devices, unassigned devices, or departments with zero devices to further validate queries.

---

## Project Significance

* Demonstrates data analysis mindset using SQL

* Shows relational modeling and operational reporting

* Handles realistic edge cases: missing logs, multiple devices, overdue maintenance

* Clean, reproducible, and ready for evaluation 

---

## Notes

* All data is synthetic and safe

* Schema and queries built for analysis and reporting exercises

* Edge cases included intentionally to test query robustness

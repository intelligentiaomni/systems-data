# Systems and Data Projects

Technical operational systems and data analysis fundamentals with reproducible problem-solving alongside long-term systems development work with scientific research and discovery perspective. 

## Projects

### 1. Python Log Analysis
Processes simulated authentication logs to detect abnormal login activity. Features include:

- Failed login aggregation and top failing IP detection
- User flagging based on configurable thresholds
- External IP identification
- Hourly time-based activity variation
- Burst detection within short windows
- JSON export of analysis results for operational use

The dataset is synthetic for demonstration purposes.

### 2. SQL IT Inventory
Demonstrates relational database design and query development for IT asset inventory:

- Schema creation (`schema.sql`)
- Seed data setup (`seed_data.sql`)
- Example queries (`queries.sql`)

Both projects illustrate structured problem-solving, operational awareness, and foundational systems / data skills.

### Possible extensions

* Real-time monitoring
* Alert system
* Dashboard integration
* Data validation rules

### Open to feedback and collaboration on systems / data projects

## Folder Structure

```
systems-data/                      

├── python-log-analysis/
│   ├── data/
│   │   └── sample_logs.csv         ← Synthetic authentication logs
│   ├── output/
│   │   └── analysis_results.json   ← JSON summary of analysis
│   ├── analysis.py                 ← Python script with thresholds,     
|   │                                 burst detection, and time-based metrics
│   ├── requirements.txt            ← Python dependencies
│   └── README.md                   ← Project-specific description
│
├── sql-it-inventory/
│   ├── schema.sql                  ← Relational database schema
│   ├── seed_data.sql               ← Sample data insertion
│   ├── queries.sql                 ← Example queries on inventory
│   └── README.md                   ← Project-specific description
│
├── .gitignore
├── README.md

Workflow Overview:

1️⃣ Python Log Analysis

output/analysis_results.json        ← JSON summary of all metrics
       ▲
       │
Sample_logs.csv
       ▲
       │
analysis.py
       │
       ├─> Failed login aggregation
       ├─> Top failing IP detection
       ├─> User flagging (threshold)
       ├─> External IP identification
       ├─> Hourly activity aggregation
       └─> Burst detection (15-min window)

2️⃣ SQL IT Inventory

queries.sql                         ← Run queries to extract insights on IT assets 
       ▲
       │
Database setup (SQLite / Postgres)
       ▲
       │
schema.sql + seed_data.sql
```
## Notes

- Thresholds and parameters in Python log analysis are configurable.
- All datasets are synthetic; no real user or infrastructure data is included.
- Built as concise, operational proofs-of-work for early technical portfolio review.
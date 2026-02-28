# Systems and Data Projects

Technical systems and data analysis with reproducible problem-solving, long-term development, and research-informed insights.

---

## Project Overview

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

### Open to feedback and collaboration on systems / data projects

---

## Roadmap

* **Real-Time Monitoring Prototype**<br>
Implement a near real-time log ingestion and alerting workflow to simulate continuous monitoring of authentication events.
* **Risk Scoring Model**<br>
Introduce weighted risk scoring for users, IPs, and devices to support prioritization and structured decision-making.
* **Anomaly Detection Layer**<br>
Implement statistical and pattern-based detection to identify irregular login activity and asset deviations.
* **Automated Analytical Report**<br>
Generate a concise technical summary (Markdown/PDF) highlighting key findings, flagged risks, and recommended actions.

---

## Directory Structure

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
---

## Notes

- Thresholds and parameters in Python log analysis are configurable.
- All datasets are synthetic; no real user or infrastructure data is included.
- Built as concise, operational proofs-of-work for early technical portfolio review.
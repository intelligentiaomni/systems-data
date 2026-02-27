# Python Log Analysis

This project analyzes synthetic authentication logs to detect abnormal login activity. It demonstrates operational log monitoring, threshold-based flagging, time-based aggregation, and burst detection in Python.

---

## Features

- Aggregates failed login attempts and identifies top failing IPs  
- Flags users exceeding configurable thresholds  
- Detects external IP activity  
- Aggregates failed logins per hour  
- Detects bursts of failed logins within short time windows  
- Exports structured results to `output/analysis_results.json`  

---

## Design and Assumptions

- Dataset is fully synthetic and safe for demonstration purposes  
- Internal IP ranges (10.0.0.0/8, 192.168.0.0/16) are treated as trusted  
- Default thresholds:
  - Failed login threshold per user: 3
  - Burst detection threshold: 3 within 15 minutes  
- Thresholds are configurable in `analysis.py` for operational tuning  
- Console output provides immediate human-readable summary  
- JSON export is machine-readable for further processing  

---

## How to Run

1. **Install dependencies** (preferably in a virtual environment):

pip install -r requirements.txt

2. **Run the analysis script:**

python analysis.py

3. **View results:**

Console displays flagged users, top failing IPs, external IPs, hourly activity, and burst detection

Structured JSON results are saved in output/analysis_results.json

---

## Example Console Output

```
Total failed logins: 7
Top failing IP: 203.0.113.55 (4 attempts)
Flagged users (threshold ≥3): {'bob.a': 3}
External IPs detected: ['203.0.113.55']
```

---
## Future Improvements

- Add visualization of login trends
- Parameterize thresholds via CLI arguments
- Add unit tests for detection logic
- Containerize with Docker

---

## Notes

* The output/ folder and JSON results are not under version control; they are generated dynamically

* Thresholds and detection windows can be tuned in analysis.py

* Built as a self-contained, operational microproject, demonstrating reproducible analysis and structured thinking.
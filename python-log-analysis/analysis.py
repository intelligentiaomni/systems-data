import pandas as pd
import json
from pathlib import Path

# ===== Configurable thresholds =====
FAILED_USER_THRESHOLD = 3
BURST_THRESHOLD = 3
BURST_WINDOW = "15min"

# ===== File paths =====
csv_path = "python-log-analysis/data/sample_logs.csv"
output_dir = Path("python-log-analysis/output")
output_dir.mkdir(exist_ok=True)  # create folder if it doesn't exist
json_output_path = output_dir / "analysis_results.json"

# ===== Load CSV =====
df = pd.read_csv(csv_path)
df['timestamp'] = pd.to_datetime(df['timestamp'])

# ===== Filter failed logins =====
failed = df[df['status'] == 'FAIL']

# 1️⃣ Total failed logins
total_failed = failed.shape[0]

# 2️⃣ Top failing IP
top_ip_counts = failed['source_ip'].value_counts()
top_ip = top_ip_counts.idxmax() if not top_ip_counts.empty else None
top_ip_count = int(top_ip_counts.max()) if not top_ip_counts.empty else 0

# 3️⃣ Users exceeding failure threshold
user_fail_counts = failed['user'].value_counts()
flagged_users = user_fail_counts[user_fail_counts >= FAILED_USER_THRESHOLD]

# 4️⃣ External IP attempts
internal_prefixes = ("10.", "192.168.")
external_ips = failed[~failed['source_ip'].str.startswith(internal_prefixes)]['source_ip'].unique()

# 5️⃣ Failed logins per hour
failed_per_hour = failed.groupby(failed['timestamp'].dt.floor('h')).size()

# 6️⃣ Burst detection
failed_indexed = failed.set_index('timestamp')
burst = failed_indexed['user'].rolling(BURST_WINDOW).count()
bursts = burst[burst >= BURST_THRESHOLD]

# ===== JSON Export =====
results = {
    "total_failed": int(total_failed),
    "top_failing_ip": {
        "ip": top_ip,
        "count": top_ip_count
    },
    "flagged_users": flagged_users.to_dict(),
    "external_ips": list(external_ips),
    "failed_per_hour": {str(k): int(v) for k, v in failed_per_hour.items()},
    "burst_detection": {str(k): int(v) for k, v in bursts.items()}
}

with open(json_output_path, "w") as f:
    json.dump(results, f, indent=4)

print(f"Analysis complete. Results exported to: {json_output_path}")
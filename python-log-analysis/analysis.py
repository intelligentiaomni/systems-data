import pandas as pd

# Path to CSV
csv_path = "python-log-analysis/data/sample_logs.csv"

# Load CSV and parse timestamps
df = pd.read_csv(csv_path)
df['timestamp'] = pd.to_datetime(df['timestamp'])

# Filter failed login attempts
failed = df[df['status'] == 'FAIL']

# 1️⃣ Total failed login attempts
total_failed = failed.shape[0]
print(f"Total failed login attempts: {total_failed}")

# 2️⃣ Top failing IP
top_ip_counts = failed['source_ip'].value_counts()
if not top_ip_counts.empty:
    top_ip = top_ip_counts.idxmax()
    top_ip_count = top_ip_counts.max()
    print(f"Top failing IP: {top_ip} ({top_ip_count} attempts)")
else:
    print("No failed login attempts found")

# 3️⃣ Users with 3 or more failed attempts
user_fail_counts = failed['user'].value_counts()
flagged_users = user_fail_counts[user_fail_counts >= 3]
if not flagged_users.empty:
    for user, count in flagged_users.items():
        print(f"User flagged: {user} ({count} failed attempts)")
else:
    print("No users with 3 or more failed attempts")

# 4️⃣ External IP attempts (outside internal ranges)
internal_prefixes = ("10.", "192.168.")
external_ips = failed[~failed['source_ip'].str.startswith(internal_prefixes)]['source_ip'].unique()
if len(external_ips) > 0:
    print("External IP attempts detected:", ", ".join(external_ips))
else:
    print("No external IP attempts detected")

# 5️⃣ Time variation: failed logins per hour
failed_per_hour = failed.groupby(failed['timestamp'].dt.floor('h')).size()
print("\nFailed logins per hour:")
for time, count in failed_per_hour.items():
    print(f"{time}: {count} attempts")

# Optional: simple burst detection (≥3 fails in 15 min window)
failed = failed.set_index('timestamp')

burst = failed['user'].rolling('15min').count()
bursts = burst[burst >= 3]

if not bursts.empty:
    print("\nSuspicious bursts within 15-minute windows:")
    for time, count in bursts.items():
        print(f"{time}: {count} failed attempts")
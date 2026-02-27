-- ==========================================
-- IT Asset Tracking System - Example Queries
-- ==========================================


-- 1️⃣ Devices per Department
-- Shows how many devices are assigned to each department.
-- Useful for inventory distribution analysis.
SELECT d.name AS department_name,
       COUNT(dev.device_id) AS device_count
FROM departments d
LEFT JOIN users u ON u.department_id = d.department_id
LEFT JOIN devices dev ON dev.assigned_user_id = u.user_id
GROUP BY d.name
ORDER BY device_count DESC;


-- 2️⃣ Devices Not Maintained in the Last 180 Days
-- Identifies devices that may require maintenance review.
SELECT dev.device_id,
       dev.asset_tag,
       MAX(m.maintenance_date) AS last_maintenance
FROM devices dev
LEFT JOIN maintenance_logs m ON m.device_id = dev.device_id
GROUP BY dev.device_id
HAVING last_maintenance IS NULL
   OR last_maintenance < DATE('now', '-180 day');


-- 3️⃣ Users with Multiple Devices
-- Detects users assigned more than one device.
SELECT u.username,
       COUNT(dev.device_id) AS device_count
FROM users u
JOIN devices dev ON dev.assigned_user_id = u.user_id
GROUP BY u.user_id
HAVING device_count > 1;


-- 4️⃣ Devices Under Warranty
-- Assumes warranty period is 3 years from purchase date.
-- Lists devices still within warranty coverage.
SELECT device_id,
       asset_tag,
       purchase_date
FROM devices
WHERE purchase_date >= DATE('now', '-3 year')
  AND status = 'active';


-- 5️⃣ Maintenance History per Device
-- Displays full maintenance records for each device.
SELECT dev.asset_tag,
       m.maintenance_date,
       m.description,
       m.performed_by
FROM maintenance_logs m
JOIN devices dev ON dev.device_id = m.device_id
ORDER BY dev.asset_tag, m.maintenance_date DESC;


-- 6️⃣ Count Devices by Status
-- Provides a quick operational overview of asset lifecycle states.
SELECT status,
       COUNT(*) AS count
FROM devices
GROUP BY status
ORDER BY count DESC;

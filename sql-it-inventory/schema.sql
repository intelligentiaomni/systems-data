-- ==========================================
-- IT Asset Tracking System - Schema
-- ==========================================

-- 1️⃣ Departments
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    location TEXT
);

-- 2️⃣ Users
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department_id INTEGER,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE SET NULL
);

-- 3️⃣ Devices
CREATE TABLE devices (
    device_id INTEGER PRIMARY KEY,
    asset_tag TEXT NOT NULL UNIQUE,
    device_type TEXT NOT NULL,        -- e.g. laptop, server, printer
    model TEXT,
    purchase_date DATE,
    status TEXT NOT NULL CHECK (status IN ('active', 'maintenance', 'retired')),
    assigned_user_id INTEGER,
    FOREIGN KEY (assigned_user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

-- 4️⃣ Maintenance Logs
CREATE TABLE maintenance_logs (
    log_id INTEGER PRIMARY KEY,
    device_id INTEGER NOT NULL,
    maintenance_date DATE NOT NULL,
    description TEXT NOT NULL,
    performed_by TEXT,
    FOREIGN KEY (device_id)
        REFERENCES devices(device_id)
        ON DELETE CASCADE
);

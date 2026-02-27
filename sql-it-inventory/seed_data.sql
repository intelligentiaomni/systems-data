-- ==========================================
-- IT Asset Tracking System - Seed Data
-- ==========================================

-- ----------------------
-- Departments
-- ----------------------
INSERT INTO departments (department_id, name, location) VALUES
(1, 'IT', 'Stockholm'),
(2, 'HR', 'Stockholm'),
(3, 'Finance', 'Gothenburg'),
(4, 'Operations', 'Malmo'),
(5, 'Marketing', 'Uppsala');


-- ----------------------
-- Users (15 total)
-- ----------------------
INSERT INTO users (user_id, username, full_name, email, department_id) VALUES
(1, 'alice.k', 'Alice Karlsson', 'alice.k@example.com', 1),
(2, 'bob.a', 'Bob Andersson', 'bob.a@example.com', 1),
(3, 'john.l', 'John Lindberg', 'john.l@example.com', 2),
(4, 'emma.s', 'Emma Svensson', 'emma.s@example.com', 3),
(5, 'maria.h', 'Maria Holm', 'maria.h@example.com', 4),
(6, 'david.r', 'David Rosen', 'david.r@example.com', 4),
(7, 'sofia.n', 'Sofia Nilsson', 'sofia.n@example.com', 5),
(8, 'erik.p', 'Erik Persson', 'erik.p@example.com', 1),
(9, 'lina.t', 'Lina Thorsson', 'lina.t@example.com', 2),
(10, 'oscar.b', 'Oscar Berg', 'oscar.b@example.com', 3),
(11, 'nina.w', 'Nina Wallin', 'nina.w@example.com', 5),
(12, 'henrik.j', 'Henrik Johansson', 'henrik.j@example.com', 4),
(13, 'sara.m', 'Sara Moller', 'sara.m@example.com', 3),
(14, 'tom.e', 'Tom Ek', 'tom.e@example.com', 2),
(15, 'clara.d', 'Clara Dahl', 'clara.d@example.com', 1);


-- ----------------------
-- Devices (~30 total)
-- ----------------------
INSERT INTO devices (device_id, asset_tag, device_type, model, purchase_date, status, assigned_user_id) VALUES
(1, 'LT-1001', 'laptop', 'Dell XPS 13', '2022-03-10', 'active', 1),
(2, 'LT-1002', 'laptop', 'Lenovo ThinkPad T14', '2021-06-15', 'active', 2),
(3, 'LT-1003', 'laptop', 'HP EliteBook', '2020-01-20', 'maintenance', 3),
(4, 'SV-2001', 'server', 'Dell PowerEdge', '2019-09-01', 'active', NULL),
(5, 'PR-3001', 'printer', 'HP LaserJet', '2018-05-10', 'active', 4),
(6, 'LT-1004', 'laptop', 'MacBook Pro', '2023-01-05', 'active', 5),
(7, 'LT-1005', 'laptop', 'Dell Latitude', '2020-11-12', 'retired', NULL),
(8, 'LT-1006', 'laptop', 'Lenovo ThinkPad X1', '2022-08-19', 'active', 6),
(9, 'LT-1007', 'laptop', 'HP ProBook', '2021-12-22', 'active', 7),
(10, 'LT-1008', 'laptop', 'Dell XPS 15', '2023-02-10', 'active', 8),
(11, 'LT-1009', 'laptop', 'Lenovo T480', '2019-04-18', 'maintenance', 9),
(12, 'LT-1010', 'laptop', 'MacBook Air', '2022-10-02', 'active', 10),
(13, 'LT-1011', 'laptop', 'HP EliteBook', '2020-07-30', 'active', 11),
(14, 'LT-1012', 'laptop', 'Dell Latitude', '2021-03-14', 'active', 12),
(15, 'LT-1013', 'laptop', 'ThinkPad L15', '2023-05-01', 'active', 13),
(16, 'LT-1014', 'laptop', 'Dell XPS 13', '2022-09-12', 'active', 14),
(17, 'LT-1015', 'laptop', 'MacBook Pro', '2021-01-19', 'active', 15),
(18, 'LT-1016', 'laptop', 'Lenovo T14', '2020-02-11', 'active', 1),
(19, 'LT-1017', 'laptop', 'HP ProBook', '2023-06-20', 'active', 2),
(20, 'LT-1018', 'laptop', 'Dell Latitude', '2019-11-25', 'maintenance', 3),
(21, 'SV-2002', 'server', 'HP ProLiant', '2018-07-07', 'active', NULL),
(22, 'PR-3002', 'printer', 'Brother HL', '2020-04-04', 'active', 4),
(23, 'LT-1019', 'laptop', 'MacBook Air', '2022-12-01', 'active', 5),
(24, 'LT-1020', 'laptop', 'Dell XPS 15', '2021-09-09', 'active', 6),
(25, 'LT-1021', 'laptop', 'ThinkPad X1', '2020-06-06', 'active', 7),
(26, 'LT-1022', 'laptop', 'HP EliteBook', '2019-10-10', 'retired', NULL),
(27, 'LT-1023', 'laptop', 'Lenovo T14', '2022-02-02', 'active', 8),
(28, 'LT-1024', 'laptop', 'Dell Latitude', '2021-08-08', 'active', 9),
(29, 'LT-1025', 'laptop', 'MacBook Pro', '2023-03-03', 'active', 10),
(30, 'LT-1026', 'laptop', 'HP ProBook', '2019-12-12', 'maintenance', 11);

-- ----------------------
-- Maintenance Logs
-- ----------------------
INSERT INTO maintenance_logs (log_id, device_id, maintenance_date, description, performed_by) VALUES
-- Recent maintenance
(1, 1, DATE('now', '-30 day'), 'Battery replacement', 'IT Support'),
(2, 2, DATE('now', '-60 day'), 'Software update', 'IT Support'),
(3, 6, DATE('now', '-10 day'), 'Screen repair', 'External Vendor'),

-- Overdue maintenance (>180 days)
(4, 3, DATE('now', '-250 day'), 'Keyboard replacement', 'IT Support'),
(5, 11, DATE('now', '-365 day'), 'OS reinstall', 'IT Support'),
(6, 20, DATE('now', '-200 day'), 'Fan replacement', 'External Vendor'),

-- Very old maintenance
(7, 4, DATE('now', '-500 day'), 'Firmware update', 'IT Support'),

-- Some devices intentionally have no maintenance logs
(8, 25, DATE('now', '-40 day'), 'Battery check', 'IT Support');

-- ----------------------
-- User with multiple devices
-- ----------------------

INSERT INTO users (user_id, username, full_name, email, department_id) VALUES
(16, 'sam.t', 'Sam Thompson', 'sam.t@example.com', 1);

INSERT INTO devices (device_id, asset_tag, device_type, model, purchase_date, status, assigned_user_id) VALUES
(31, 'LT-1027', 'laptop', 'Dell Latitude', '2022-06-01', 'active', 16),
(32, 'LT-1028', 'laptop', 'MacBook Pro', '2021-12-01', 'active', 16);

-- Device with no maintenance logs
INSERT INTO devices (device_id, asset_tag, device_type, model, purchase_date, status, assigned_user_id) VALUES
(33, 'LT-1029', 'laptop', 'HP ProBook', '2020-09-10', 'active', 3);
-- No maintenance_logs entry for LT-1029 → triggers “overdue maintenance” query

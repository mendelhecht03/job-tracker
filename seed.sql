PRAGMA foreign_keys = ON;

DELETE FROM payments;
DELETE FROM job_entries;
DELETE FROM jobs;
DELETE FROM categories;

INSERT INTO categories (id, name) VALUES
    (1, 'Tutoring'),
    (2, 'Writing'),
    (3, 'Design'),
    (4, 'Development'),
    (5, 'Admin');

INSERT INTO jobs (
    id,
    category_id,
    rate_type,
    hourly_rate,
    payday_date,
    title
)
VALUES
    (1, 1, 'hourly_rate', 2500, 15, 'Math tutoring'),
    (3, 2, 'hourly_rate', 3000, 10, 'Newsletter writing'),
    (5, 4, 'hourly_rate', 4500, 25, 'Website maintenance'),
    (7, 5, 'hourly_rate', 2000, 5, 'Client admin');

INSERT INTO jobs (
    id,
    category_id,
    rate_type,
    fixed_rate,
    payday_date,
    title
)
VALUES
    (2, 1, 'fixed_rate', 5000, 15, 'SAT prep session'),
    (4, 3, 'fixed_rate', 12000, 20, 'Logo concept'),
    (6, 4, 'fixed_rate', 18000, 25, 'Landing page audit');

INSERT INTO job_entries (
    job_id,
    date_completed,
    time_worked,
    notes
)
VALUES
    (1, '2026-05-01', 2.0, 'Algebra review'),
    (3, '2026-05-02', 1.5, 'Drafted newsletter outline'),
    (5, '2026-05-03', 1.0, 'Checked uptime and plugin updates'),
    (7, '2026-05-04', 0.75, 'Sorted invoices'),
    (1, '2026-05-05', 2.5, 'Quadratic equations'),
    (3, '2026-05-06', 2.0, 'Wrote feature section'),
    (5, '2026-05-07', 1.25, 'Fixed contact form styling'),
    (7, '2026-05-08', 1.0, 'Updated client spreadsheet'),
    (1, '2026-05-09', 2.0, 'Geometry practice'),
    (3, '2026-05-10', 1.0, 'Edited intro copy'),
    (5, '2026-05-11', 2.5, 'Investigated slow image loading'),
    (7, '2026-05-12', 0.5, 'Sent follow-up emails'),
    (1, '2026-05-13', 3.0, 'SAT math drills'),
    (3, '2026-05-14', 2.25, 'Completed newsletter draft'),
    (5, '2026-05-15', 1.5, 'Updated homepage dependencies'),
    (7, '2026-05-16', 1.25, 'Prepared weekly summary'),
    (1, '2026-05-17', 1.5, 'Factoring review'),
    (3, '2026-05-18', 1.75, 'Revisions from client notes'),
    (5, '2026-05-19', 2.0, 'Added analytics event checks'),
    (7, '2026-05-20', 0.75, 'Reconciled receipts'),
    (1, '2026-05-21', 2.5, 'Probability practice'),
    (3, '2026-05-22', 1.5, 'Final proofread'),
    (5, '2026-05-23', 1.0, 'Backed up content'),
    (7, '2026-05-24', 1.0, 'Updated task board'),
    (1, '2026-05-25', 2.0, 'Timed practice set'),
    (3, '2026-05-26', 2.0, 'Started June newsletter outline'),
    (5, '2026-05-27', 3.0, 'Patched responsive layout issue'),
    (7, '2026-05-28', 0.5, 'Scheduled check-in calls'),
    (1, '2026-05-29', 2.5, 'Reviewed final mistakes'),
    (3, '2026-05-30', 1.25, 'Pulled source links'),
    (5, '2026-05-31', 1.5, 'Monthly maintenance wrap-up');

INSERT INTO job_entries (
    job_id,
    date_completed,
    completed,
    notes
)
VALUES
    (2, '2026-05-01', 1, 'Completed one SAT prep session'),
    (4, '2026-05-06', 1, 'Delivered first logo concept'),
    (6, '2026-05-11', 1, 'Completed audit notes'),
    (2, '2026-05-15', 1, 'Completed second SAT prep session'),
    (4, '2026-05-20', 1, 'Delivered revised logo concept'),
    (6, '2026-05-25', 1, 'Completed follow-up audit'),
    (2, '2026-05-31', 1, 'Completed month-end SAT prep session');

INSERT INTO payments (
    job_id,
    amount,
    notes
)
VALUES
    (1, 31250, 'Paid for May tutoring through the 15th'),
    (2, 10000, 'Paid for first two SAT prep sessions'),
    (3, 33750, 'Paid for first newsletter batch'),
    (4, 12000, 'Paid for logo concept delivery'),
    (5, 56250, 'Paid for May website maintenance'),
    (6, 18000, 'Paid for landing page audit'),
    (7, 8500, 'Paid for May admin support');

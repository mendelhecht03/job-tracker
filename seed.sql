PRAGMA foreign_keys = ON;

INSERT INTO categories (name) VALUES 
    ('Tutoring'),
    ('Writing');

INSERT INTO jobs (
    category_id,
    rate_type,
    hourly_cents,
    payment_date,
    title
)
VALUES (
    1, 'hourly_rate',
    2500,
    15,
    'Math tutoring'
);

INSERT INTO jobs (
    category_id,
    rate_type,
    fixed_cents,
    payment_date,
    title
)

VALUES (
    1,
    'fixed_rate',
    5000,
    15,
    'SAT prep session'
);

INSERT INTO job_entries (
    job_id,
    date,
    time_worked,
    notes
)
VALUES (
    1,
    '2026-06-01',
    2.5,
    "Algebra review"
);

INSERT INTO job_entries (
    job_id,
    date,
    completed,
    notes
)
VALUES (
    2,
    '2026-06-01',
    1,
    'Completed one SAT prep session'
);
INSERT INTO payments (
    job_id,
    amount,
    notes
)
VALUES (
    1,
    6250,
    'Paid for 2.5 hours of tutoring'
);
CREATE TABLE categories (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
CREATE TABLE jobs (
    id INTEGER PRIMARY KEY,
    category_id  INTEGER NOT NULL,
    rate_type TEXT NOT NULL CHECK(rate_type IN ('fixed_rate', 'hourly_rate')),
    fixed_cents INTEGER CHECK(fixed_cents >= 0),
    hourly_cents INTEGER CHECK (hourly_cents >= 0),
    payment_date INTEGER NOT NULL CHECK(payment_date BETWEEN 1 AND 31), 
    title TEXT NOT NULL,

    CHECK (
        (rate_type = 'fixed_rate') = (fixed_cents IS NOT NULL)
        AND 
        (rate_type = 'hourly_rate') = (hourly_cents IS NOT NULL)
    ),
        
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE job_entries (
    id INTEGER PRIMARY KEY,
    job_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    completed INTEGER CHECK(completed IN (0,1)), -- Only applies to fixed rate jobs
    time_worked REAL CHECK(time_worked >= 0), -- Only applies to hourly rate jobs
    notes TEXT,  
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);
CREATE TABLE payments (
    id INTEGER PRIMARY KEY,
    job_id INTEGER NOT NULL,
    amount INTEGER NOT NULL CHECK (amount >= 0),
    notes TEXT,
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);


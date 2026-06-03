CREATE TABLE categories (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
CREATE TABLE jobs (
    id INTEGER PRIMARY KEY,
    category_id  INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    rate_type TEXT NOT NULL CHECK(rate_type IN ('fixed_rate', 'hourly_rate')),
    fixed_rate INTEGER CHECK(fixed_rate >= 0),
    hourly_rate INTEGER CHECK (hourly_rate >= 0),
    payday_date INTEGER CHECK(payday_date BETWEEN 1 AND 31),
    CHECK (
        (rate_type = 'fixed_rate') = (fixed_rate IS NOT NULL)
        AND 
        (rate_type = 'hourly_rate') = (hourly_rate IS NOT NULL)
    ),
        
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE job_entries (
    id INTEGER PRIMARY KEY,
    job_id INTEGER NOT NULL,
    date_completed TEXT NOT NULL DEFAULT (date('now')),   
    completed INTEGER CHECK(completed IN (0,1)),
    time_worked REAL CHECK(time_worked >= 0),
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

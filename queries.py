NEW_JOB = """
INSERT INTO jobs (
category_id,
client_name,
description,
rate_type,
rate,
payday_date
)
VALUES (
    :category_id,
    :client_name,
    :description,
    :rate_type,
    :rate,
    :payday_date
    
)
 """
ALL_JOBS = """
SELECT
    jobs.id,
    categories.name AS category,
    jobs.client_name,
    jobs.description,
    jobs.rate_type,
    jobs.rate,
    jobs.payday_date
FROM jobs
JOIN categories ON categories.id = jobs.category_id
ORDER BY jobs.id
"""

ALL_PAYMENTS = """
SELECT
    jobs.client_name,
    categories.name AS category,
    payments.amount
FROM payments
JOIN jobs ON jobs.id = payments.job_id
JOIN categories ON categories.id = jobs.category_id
ORDER BY payments.id
"""




import os 
import queries as sql
import sqlite3

TEST_DB = 'test.db'

def create_new_job(cur, con): # works

    job_details = get_job_details(cur)

    print("Jobs before insert:")
    for row in fetch_all_jobs(cur):
        print(row)

    cur.execute(sql.NEW_JOB, job_details)
    con.commit()

    print("Jobs after insert:")
    for row in fetch_all_jobs(cur):
        print(row)
def create_new_category(cur, con): # works
    category = input("Category: ")
    cur.execute('INSERT INTO categories(name) VALUES (?)', (category,))
    con.commit()
def validate_category(cur, category): # works
    # Get all category names
    category_names = fetch_all_categories(cur)
    while category not in category_names:
            print("Please enter valid category")
            print(f"Valid Categories: {category_names}")
            category = input("Category: ")
    category_id = cur.execute(
        """
        SELECT id FROM categories
        WHERE name = ? """, (category,)).fetchone()[0]
    return category_id
def fetch_all_categories(cur): # works
    # Get job categories as list of tuples
    category_rows = cur.execute('SELECT name FROM categories').fetchall()
    # Normalize list into a list of strings
    category_names = []
    for row in category_rows:
        category_names.append(row[0])
    return category_names
def fetch_all_jobs(cur): # works
    jobs = cur.execute(sql.ALL_JOBS).fetchall()
    # print(f"DEBUG: found {len(jobs)} jobs")
    return jobs
def log_completed_job(cur, con):


    pass
def refresh_database(): # works
    if os.path.exists(TEST_DB):
        os.remove(TEST_DB)


    con = sqlite3.connect(TEST_DB)
    cur = con.cursor()

    with open("job-tracker.sql", "r") as main_schema_file:
        cur.executescript(main_schema_file.read())

    with open("seed.sql", "r") as seed_file:
        cur.executescript(seed_file.read())

    con.commit() 
    print("succesfully reset database")
    return con, cur
def fetch_completed_jobs():
    pass 
def log_new_payment():
    # TODO create log_new_payment function
    pass
def get_job_details(cur):
    category_id = validate_category(cur, input("Category: "))
    job_details = {
        "category_id": category_id,
        "client_name": input("Client Name: "),
        "description": input("Description: "),
        "rate_type": input("Rate Type: "),
        "rate": input("Rate: "),
        "payday_date": input("Payday Date: "),
    }
    
    return job_details
def fetch_all_payments(cur):
    return cur.execute(sql.ALL_PAYMENTS).fetchall()
# TODO Create delete_category function
# TODO Create total_owed function

def main():
    con, cur = refresh_database()

    print("enter help for list of commands")

    try:
        while True:
            user_input = input("$ ")

            if user_input == "new category":
                create_new_category(cur, con)        
            elif user_input == "new job":
                create_new_job(cur, con)
            elif user_input == "list categories":
                print(fetch_all_categories(cur))
            elif user_input == "list jobs":
                for row in fetch_all_jobs(cur):
                    print(row)
            elif user_input == "list payments":
                for row in fetch_all_payments(cur):
                    print(row)
    except KeyboardInterrupt:
        con.close()
        print('goodbye')
    
main()





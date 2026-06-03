import sys
import os 
import sqlite3

DB_FILE = 'test.db'
# overwrites test.db file
if os.path.exists('test.db'): 
    os.remove('test.db')

connection = sqlite3.connect(DB_FILE)
cursor = connection.cursor()

with open("job_tracker.sql", "r") as main_schema_file:
    cursor.executescript(main_schema_file.read())

with open("seed.sql", "r") as seed_file:
    cursor.executescript(seed_file.read())
# Save the schema and seed to test.db
connection.commit() 

def get_job_info():
    print("\nAdd Job:")
    print("-------")
    return {
        "category": check_category(input("Category: ")),
        "title": input("Title: "),
        "description": input("Description: "),
        "rate_type": input("Rate Type: "),
        "hourly_rate": input("Rate: "),
        "fixed_rate": input ("Rate: "),
        "payday": input("Payday: ")
    }
def add_job():
    job_details = get_job_info()
    for value in job_details:
        cursor.execute('INSERT INTO jobs() VALUES (?)', ())

# TODO Create delete_job function

# 
def add_category():
    category = input('Category:')
    cursor.execute('INSERT INTO categories VALUES (?)', (category,))
# TODO Create delete_category function
# TODO Create total_owed function
# TODO Create all_jobs function


# Check if category is a valid category
def check_category(category):
    # Get job categories as list of tuples
    category_rows = cursor.execute('SELECT name FROM categories').fetchall()

    # Normalize list into a list of strings
    category_names = []
    for row in category_rows:
        category_names.append(row[0])

    while category not in category_names:
            print("Please enter valid category")
            print(f"Valid Categories: {category_names}")
            category = input("Category: ")


    return category

    


# Create add_job function
def main():
    while True:
        user_input = input('$ ')

        if user_input == 'add job':
            job_items = get_job_info()         
            


        elif user_input == 'quit':
            return

main()

connection.commit()
connection.close()




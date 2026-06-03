from pathlib import Path
import sqlite3

db_path = Path(__file__).with_name("test.db")

connection = sqlite3.connect(db_path)
cursor = connection.cursor()

cursor.execute("SELECT * FROM jobs")
rows = cursor.fetchall()

for row in rows:
    print(row)

connection.close()
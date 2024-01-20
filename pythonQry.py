# Sara McHattie
# Python sql query

from sqlalchemy import *
import pandas as pd

# quick query to see if the program is working
engine = create_engine(
    "mysql+pymysql://{db_username}:{db_password}@localhost:3306/company")

sql = "SELECT * FROM employee"
df = pd.read_sql(sql, con=engine)

print("*** EMPLOYEE TABLE ***")
print(df)

# query 1: Name of all projects

sql = "SELECT pname FROM project"
df = pd.read_sql(sql, con=engine)

print("*** PROJECT NAMES ***")
print(df)

# query 2: Number of employees in each department
sql = """SELECT DISTINCT COUNT(ssn) AS num_emp, dname 
        FROM employee AS e 
        INNER JOIN department AS d 
        ON e.dno = d.dnumber 
        GROUP BY dname"""

df = pd.read_sql(sql, con=engine)

print("*** DEPARTMENT EMPLOYEES ***")
print(df)

# query 3: department average emp salary over 30000
# since I put monthly income into the tables, I have to multiply by 12 for annual avg

sql = """SELECT dname, COUNT(dno) AS num_employees 
        FROM employee AS e 
        INNER JOIN department AS d 
        ON e.dno = d.dnumber 
        WHERE salary * 12 > 30000 
        GROUP BY dname 
        HAVING AVG(salary * 12) > 30000 
        ORDER BY dname"""

df = pd.read_sql(sql, con=engine)

print("*** AVG SALARY > 30,000 ***")
print(df)

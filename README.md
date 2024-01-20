# Company Database Project

This project was developed as part of a second-semester database class. It includes a MySQL database schema, sample data, and a Python script for executing SQL queries. 

## Table of Contents

- [Introduction](#introduction)
- [Database Schema](#database-schema)
- [Setting Up the Project](#setting-up-the-project)
- [Running Queries](#running-queries)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project is a database assignment that focuses on designing a relational database for a fictional company. It includes tables for employees, departments, projects, and more. Additionally, there is a Python script for executing SQL queries on the database.

## Database Schema

The project includes the following tables in the database:

- `employee`: Information about company employees.
- `department`: Details about different departments within the company.
- `dept_location`: Locations associated with each department.
- `project`: Information about various projects the company is involved in.
- `works_on`: Details about employee project assignments.
- `dependent`: Information about dependents of company employees.

The ERD (Entity-Relationship Diagram) is available [here](companyERD.pdf).

## Setting Up the Project

1. Clone this repository to your local machine.
2. Install the required dependencies using `pip install -r requirements.txt`.

## Running Queries

The `pythonQry.py` script contains sample SQL queries that can be executed using Python. Update the script as needed for your specific use case. Before running the script, make sure to set up the database connection details in the script or use environment variables.


Contributing
If you find issues or have improvements to suggest, feel free to open an issue or submit a pull request. Contributions are welcome!

License
This project is licensed under the MIT License.

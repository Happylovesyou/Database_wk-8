# Student Records Database (MySQL)

## Overview
This project is a relational database management system (DBMS) built using **MySQL**.  
It models a **Student Records System** that stores and manages information about students, courses, enrollments, and grades.  

This solution is for **Assignment Question 1: Build a Complete Database Management System**.

## Features
- Structured relational database
- Well-defined tables with appropriate constraints:
  - `PRIMARY KEY`
  - `FOREIGN KEY`
  - `NOT NULL`
  - `UNIQUE`
- Relationships implemented:
  - One-to-Many (Students → Enrollments, Courses → Enrollments)
  - Many-to-Many (Students ↔ Courses via Enrollments)

## Files
- `student_records.sql` → Contains all SQL statements:
  - `CREATE DATABASE`
  - `CREATE TABLE`
  - Relationship constraints

## How to Run
1. Open your MySQL client or Workbench.
2. Run the following command to import the database:
   ```sql
   SOURCE path/to/student_records.sql;

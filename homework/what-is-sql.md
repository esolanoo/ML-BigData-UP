
# What is SQL?

Eduardo Solano Jaime - 0213663

23/02/24

## Introduction to SQL

SQL, short for Structured Query Language, a powerful tool for database management. It's a language that helps you organize and work with data in a relational database. SQL lets you interact with data neatly organized in tables, with rows and columns; allowing you to store, update, remove, search, and retrieve information with ease. It's not just about managing data: SQL also helps in keeping databases running smoothly and efficiently.

Data analysts learn and use SQL because it integrates well with different programming languages. SQL queries can be embeded  with Java programming language to build high-performing data processing applications with major SQL database systems such as Oracle or MS SQL Server. SQL is also fairly easy to learn.

### Components

Relational Databse Managment Systems (RDBMS) use SQL using the following principal components:

   1. Table: is the basic element od a RDBMS. It contains rows and columns.
   2. Statements: also known as '*queries*', are instructions to interact with the components.
   3. Stored procedures: one or more statements stored in the database to increase performance.

## How does it work?

With the use of specific assigned words, SQL commands can filter and return results from the RBDMS. These different statements can be categorized as follows:

- Data Definition Language (**DDL**): create and modify the database objects.
- Data Query Language (**DQL**): retrieving data from the databases.
- Data Manipulation Language (**DML**): overwrites or modify existing records.
- Data Control Language (**DCL**): manage and authorize/deny access to the database
- Trasaction Control Language (**TCL**): automatic changes in the databases.

## MySQL

MySQL is a relational database management system provided by Oracle, it stands out as an open-source solution. This means developers can freely download and use MySQL without any licensing costs. Its versatility extends to various operating systems and cloud servers, making it a go-to choice for many web applications.

### SQL or MySQL

When comparing SQL to MySQL, it's important to note that SQL is a standardized language for creating and managing databases, while MySQL is a specific relational database program that utilizes SQL queries. While SQL commands adhere to international standards, MySQL continuously evolves through upgrades and enhancements.

## NoSQL

It refers to **No**-relational Databases, which are database systems that store unstructured data (not in the table format).

It dosn't necessarily represent the opposite from SQL, data may also be represented in tables within a NoSQL database, coexisting with unstructured data.

## Commands

Althou there are a great number of commands in the diferent programs supported by SQL, the most common remain: 

| SQL Command     | Description                           |
|-----------------|---------------------------------------|
| SELECT          | extracts data from a database        |
| UPDATE          | updates data in a database           |
| DELETE          | deletes data from a database         |
| INSERT INTO     | inserts new data into a database     |
| CREATE DATABASE | creates a new database               |
| ALTER DATABASE  | modifies a database                  |
| CREATE TABLE    | creates a new table                  |
| ALTER TABLE     | modifies a table                     |
| DROP TABLE      | deletes a table                      |
| CREATE INDEX    | creates an index (search key)        |
| DROP INDEX      | deletes an index                     |

## Examples of SQL

```sql
-- Select all records from the Customers table
SELECT * FROM Customers; 

-- Costumers from Mexico
SELECT * FROM Customers
WHERE Country='Mexico';

-- Insert data
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- Delete records
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
```
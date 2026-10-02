# Online Bookstore Database

This is a MySQL database project from my database course.

I first designed the basic database structure for my midterm project.
Later, I added more SQL features for the final project, such as VIEWs,
INDEX and EXPLAIN, transactions, and a stored procedure.

The table and column names are kept in Chinese because the original course
was taught in Chinese. I added simple English comments and documents so the
project is easier to understand.

## What I learned

### Midterm: database foundation
- Designed an ER diagram
- Created relational tables with primary keys and foreign keys
- Learned 1NF, 2NF, and 3NF
- Created the database and tables in MySQL
- Inserted sample data
- Practised basic SELECT, WHERE, and ORDER BY queries

### Final: more SQL features
- Created VIEWs for order details and sales reports
- Added an INDEX on book titles
- Used EXPLAIN to compare query plans before and after the index
- Used COMMIT and ROLLBACK in transaction examples
- Created a stored procedure to calculate a member's total spending

## Project structure

```text
online-bookstore-database/
├── README.md
├── database/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   ├── 03_basic_queries.sql
│   ├── 04_views.sql
│   ├── 05_indexes_explain.sql
│   ├── 06_transactions.sql
│   └── 07_stored_procedure.sql
├── docs/
│   ├── 01_project_overview.md
│   ├── 02_relational_schema.md
│   ├── 03_normalization.md
│   ├── 04_learning_journey.md
│   └── er_diagram.png
└── screenshots/
    ├── explain_before_index.png
    └── explain_after_index.png
```

## How to run

Run the SQL files in this order:

1. `database/01_schema.sql`
2. `database/02_sample_data.sql`
3. `database/03_basic_queries.sql`
4. `database/04_views.sql`
5. `database/05_indexes_explain.sql`
6. `database/06_transactions.sql`
7. `database/07_stored_procedure.sql`

## Tools

- MySQL
- MySQL Workbench

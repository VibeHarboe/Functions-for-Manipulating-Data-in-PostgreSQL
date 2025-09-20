# 🧠 Functions for Manipulating Data in PostgreSQL

This project explores PostgreSQL’s core and advanced function capabilities for transforming and analyzing structured data. Built as part of the DataCamp course **“Functions for Manipulating Data in PostgreSQL”**, the repository documents hands-on exercises and best practices — using the Sakila DVD rental database — across a wide range of use cases:

* Metadata queries (`INFORMATION_SCHEMA`)
* Date/time operations and arithmetic
* String parsing and formatting
* Type casting and conversion
* Array handling and filtering
* Full-text search and pattern matching

---

## 🌟 Project Purpose

To showcase and document practical PostgreSQL functions that support real-world tasks in:

* Reporting and dashboards
* Data cleaning and preparation
* Business logic implementation
* Feature engineering for analytics

---

## 🧠 Skills Acquired

* `INFORMATION_SCHEMA` metadata exploration
* Date/time manipulation with `AGE()`, `DATE_TRUNC()`, `EXTRACT()`, `CURRENT_TIMESTAMP`
* Type conversion using `CAST()` and `::`
* String manipulation with `CONCAT()`, `REPLACE()`, `INITCAP()`, `LEFT()`, `REGEXP_REPLACE()`
* Array operations using `ANY`, `@>`, indexing
* Conditional logic with `CASE`, `COALESCE`, `NULLIF`
* Search and matching with `ILIKE`, `SIMILAR TO`, `TO_TSVECTOR`, `plainto_tsquery`
* Full-text search and user-defined enum types

---

## 📁 Repository Structure

```
functions-for-manipulating-data-postgresql/
🔹 README.md
🔹 sql/
🔸 01_information_schema_and_datatypes.sql
🔸 02_date_time_data_types.sql
🔸 03_arrays.sql
🔸 04_casting_and_conversion.sql
🔸 05_text_manipulation.sql
🔸 06_full_text_search.sql
🔹 docs/
🔸 information_schema-guide.md
🔸 date-time-functions.md
🔸 array-functions-explained.md
🔸 casting-vs-conversion.md
🔸 text-manipulation-guide.md
🔸 full-text-search_and_patterns.md
🔸 function-best-practices.md
🔹 data/
🔸 *.csv (Sakila tables)
🔹 visuals/
🔸 *.png (dashboard snippets or ER diagrams)
🔹 certificate.pdf
```

---

## 📂 Sample Tables from Sakila

* `actor`, `film`, `customer`, `rental`, `inventory`
* `category`, `address`, `payment`, `film_actor`

---

## 🗒️ Certificate of Completion

🗰 Completed the [Functions for Manipulating Data in PostgreSQL](https://www.datacamp.com/) course via DataCamp.
📋 See: [`certificate.pdf`](./certificate.pdf)

---

## 🚀 How to Use This Repository

1. Load `.csv` files into your PostgreSQL instance
2. Execute SQL files to explore specific function types
3. Read companion `docs/*.md` to understand business value and best practices
4. Reuse patterns in your own analytics or development projects

---

## 📚 Why This Project Matters

SQL functions in PostgreSQL are fundamental for transforming raw data into clean, structured, and insightful outputs. Mastering them enables you to:

* Minimize ETL logic in app layers
* Standardize data preparation across teams
* Enable real-time analytics and feature computation

This repository provides a reusable blueprint for high-impact function design in production, modeling, and BI environments.

# Functions for Manipulating Data in PostgreSQL

A hands-on SQL project exploring PostgreSQL’s built-in functions for transforming, formatting, and cleaning data. Based on the DataCamp course *Functions for Manipulating Data in PostgreSQL*, this repository showcases practical use of text, numeric, date/time, and type conversion functions — all optimized for real-world business needs.

---

## 🎯 Project Description

This project demonstrates how PostgreSQL’s scalar and formatting functions can be used to:

* Clean and standardize messy input
* Enrich and calculate derived columns
* Convert between data types
* Build layered logic with chained functions

The queries are organized thematically and paired with documentation and examples to serve as a reference toolkit for data professionals.

---

## 🛠️ Key Skills Practiced

* 🔤 **String functions**: `LOWER()`, `INITCAP()`, `TRIM()`, `REPLACE()`
* 🔢 **Numeric functions**: `ROUND()`, `CEIL()`, `FLOOR()`, arithmetic expressions
* 🕒 **Date/time functions**: `AGE()`, `EXTRACT()`, `NOW()`, `DATE_TRUNC()`
* 🔁 **Type casting**: `CAST()`, `::`, converting between text, int, date, etc.
* 🔗 **Function chaining**: Nesting multiple transformations in a single expression

---

## 📁 Folder Overview

| Folder            | Content                                                          |
| ----------------- | ---------------------------------------------------------------- |
| `sql/`            | Thematic SQL files with examples for string, numeric, date, etc. |
| `docs/`           | Markdown guides for each function group and business context     |
| `data/`           | Sakila sample dataset (CSV version) used for all query demos     |
| `visuals/`        | (Optional) Screenshots of transformations and function outputs   |
| `certificate.pdf` | DataCamp certificate of completion                               |

---

## 📄 Certificate

📜 [View certificate](https://www.datacamp.com/statement-of-accomplishment/course/b49ec92177e3c2ecced4c000c84dbbff12ccfbb8?raw=1)

---

## 🗃️ Dataset Used – Sakila

All SQL examples are powered by the [Sakila](https://dev.mysql.com/doc/sakila/en/) sample dataset, adapted to CSV format for this project. Sakila simulates a DVD rental business and is widely used for relational data training.

**Included tables:**
`actor`, `film`, `category`, `language`, `customer`, `address`, `rental`, `payment`, `inventory`, `film_actor`

These tables allow demonstration of realistic function use cases such as:

* Text cleaning in customer and address fields
* Numeric rounding in payments
* Date manipulation across rental timestamps
* Type conversion across film metadata

---

## 📚 Documentation (docs/)

* `string-functions-explained.md`
* `numeric-functions-explained.md`
* `date-functions-explained.md`
* `type-casting-in-postgresql.md`
* `function-chains-in-sql.md`
* `business-value-of-postgresql-functions.md`

Each document explains the concept, syntax, and use cases — with added business insight.

---

## 🚀 Project Goal

Build a clean, professional SQL reference project that highlights your ability to manipulate and transform data efficiently — using PostgreSQL’s core capabilities.

Ready to use in analytics projects, dashboards, or production data pipelines.

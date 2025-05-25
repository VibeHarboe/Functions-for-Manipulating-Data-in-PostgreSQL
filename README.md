# Functions for Manipulating Data in PostgreSQL

This project explores PostgreSQL's built-in functions for transforming and analyzing structured data. It is based on the DataCamp course “Functions for Manipulating Data in PostgreSQL” and includes practical use cases across information schema, date/time operations, string and type casting, and array manipulation — all demonstrated on the Sakila DVD rental database.

---

## 🎯 Project Goal

To document and showcase real-world SQL techniques using PostgreSQL functions that are useful in reporting, data cleaning, feature extraction, and performance optimization.

---

## 📚 Skills Acquired

* 🔎 Querying metadata with `INFORMATION_SCHEMA`
* 📅 Working with `DATE`, `TIME`, and `INTERVAL` values
* 🔤 Text transformation using `UPPER()`, `LOWER()`, `INITCAP()`, `CONCAT()`, etc.
* 🔁 Type casting with `CAST()` and PostgreSQL shorthand `::`
* 🧮 Accessing and filtering `ARRAY` values with `@>`, `ANY`, and indexing
* 🧠 Combining functions for clean, structured outputs

---

## 📁 Repository Structure

```
functions-for-manipulating-data-postgresql/
├── README.md
├── sql/
│   ├── 01_information_schema.sql
│   ├── 02_date_time_data_types.sql
│   ├── 03_arrays.sql
│   ├── 04_casting_and_conversion.sql
│   └── 05_text_manipulation.sql
├── data/
│   └── *.csv (Sakila demo data)
├── docs/
│   ├── arrays-in-postgresql.md
│   ├── string-functions-explained.md
│   ├── type-casting-in-postgresql.md
│   ├── date-functions-explained.md
│   ├── business-value-of-postgresql-functions.md
│   └── reporting-strategies.md
├── visuals/
│   └── *.png (optional screenshots)
└── certificate.pdf
```

---

## 📦 Dataset

All examples use the **Sakila** DVD rental dataset in `.csv` format.
Tables include:

* `actor`, `film`, `category`, `customer`, `rental`, `inventory`, `payment`, etc.

---

## 📄 Certificate

✅ Successfully completed the [Functions for Manipulating Data in PostgreSQL](https://www.datacamp.com/) course on DataCamp.

📎 See certificate: [`certificate.pdf`](./certificate.pdf)

---

## 🚀 How to Use This Project

* Run each `.sql` file to explore how different PostgreSQL functions behave.
* Use the `/docs/` files to understand concepts, use cases, and business value.
* Download and connect the `data/` files to your own PostgreSQL instance if needed.

---

## 🧠 Inspiration

This project is part of a professional SQL learning journey focused on building a hands-on portfolio of applied skills — powering reporting, dashboarding, and data engineering use cases in PostgreSQL.

# 📁 SQL Queries – Functions for Manipulating Data in PostgreSQL

This folder contains practice-ready SQL queries structured around PostgreSQL's built-in functions for inspecting, transforming, and cleaning data. Each `.sql` file is organized thematically and uses real data from the Sakila DVD rental dataset.

---

## 📄 File Overview

| Filename                            | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| `01_information_schema.sql`        | Inspecting table metadata using `INFORMATION_SCHEMA` and column data types |
| `02_date_time_data_types.sql`      | Working with `DATE`, `TIME`, `INTERVAL`, and timestamp arithmetic           |
| `03_arrays.sql`                    | Accessing, searching, and filtering data in `ARRAY` columns                 |
| `04_casting_and_conversion.sql`    | Casting between data types, using `::`, `CAST()`, and implicit conversions  |
| `05_text_manipulation.sql`         | Advanced string processing: `CONCAT`, `LEFT`, `POSITION`, `SPLIT_PART()`, regex, and padding |

---

## ✅ Query Standards

- All queries are written in PostgreSQL syntax and follow modular, reusable formatting.
- Section headers and in-line comments are included for easy navigation and learning.
- Sample queries are ordered by real-world use case relevance and function category.

---

## 🛠 Usage Notes

- All examples assume the **Sakila DVD Rental** schema is loaded.
- Use `LIMIT` when previewing large datasets.
- Many queries highlight multiple ways to accomplish the same task for comparison (e.g., `SUBSTRING` vs `SPLIT_PART`).

---

## 📚 Related Topics

For a deeper explanation of the techniques used in these SQL examples, see the `docs/` folder:

- `case-and-conditional-logic.md`
- `reporting-strategies.md`
- `window-functions-explained.md`
- `short-vs-correlated-subqueries.md`

---

These files support the GitHub project repository: [Functions for Manipulating Data in PostgreSQL](../).

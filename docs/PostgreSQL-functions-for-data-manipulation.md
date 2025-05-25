# Overview of PostgreSQL Functions for Data Manipulation

PostgreSQL provides a rich set of functions to transform, clean, and manipulate data. These built-in functions span across categories like string handling, date/time arithmetic, arrays, conditional logic, and type conversion. Mastering these functions is essential for writing concise, powerful, and production-ready SQL.

---

## 🔧 Function Categories Covered

This project demonstrates the use of the following categories of PostgreSQL functions:

| Function Category       | Description                                                                                                                            |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| **String Functions**    | Transform, clean, and extract text using functions like `CONCAT`, `REPLACE`, `LEFT`, `REGEXP_REPLACE`, etc.                            |
| **Date/Time Functions** | Manipulate dates and timestamps with `AGE()`, `INTERVAL`, `DATE_TRUNC()`, `EXTRACT()`, `NOW()`, `CURRENT_TIMESTAMP`, `CAST()` and more |
| **Array Functions**     | Access and filter values in arrays using `[]`, `ANY`, `@>`, and functions like `SPLIT_PART()`                                          |
| **Casting/Conversion**  | Convert between data types using `::`, `CAST()`, `TO_CHAR()`, and PostgreSQL's implicit conversions                                    |
| **Conditional Logic**   | Build derived columns using `CASE`, `COALESCE()`, and null handling functions                                                          |
| **System Functions**    | Query metadata using `INFORMATION_SCHEMA`, `pg_type`, `pg_enum` to inspect columns and user-defined types                              |
| **Enumerated Types**    | Create and manage fixed-value sets using `CREATE TYPE ... AS ENUM (...)` and explore them with `pg_enum`                               |

---

## 🧠 Why Functions Matter in SQL Workflows

PostgreSQL functions are critical for:

* Creating readable and maintainable derived columns
* Wrangling messy or complex string fields
* Converting between data types for downstream processes
* Building conditional logic into SELECT statements
* Performing interval arithmetic and tracking overdue data
* Extracting time components and aggregating by truncation level
* Preprocessing data for reporting, visualization, or machine learning

Used properly, these functions allow you to shift data transformation closer to the database layer, reducing complexity in application code.

---

## ✅ Best Practices for Using Functions

* **Use aliases** to clarify derived fields (e.g. `AS full_name`)
* **Combine functions** with caution — avoid deeply nested expressions when CTEs can simplify logic
* **Watch for NULLs** — functions like `POSITION()` or `REVERSE()` may behave differently with missing values
* **Use `LIMIT`** when previewing results of function-heavy queries to avoid performance overhead
* **Profile performance** when using regex or window-based logic on large datasets
* **Always label time precision** when using `CURRENT_TIMESTAMP(x)` to reduce confusion in output
* **Use `pg_type`, `pg_enum`**, and `INFORMATION_SCHEMA` to inspect enums and column metadata in production environments

---

This project demonstrates how PostgreSQL functions can be used for real-world data wrangling, preparation, and reporting with clarity and structure. Each `.sql` file provides concrete, reusable examples grouped by function category and business use case.

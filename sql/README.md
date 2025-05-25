# PostgreSQL Function Exercises – SQL Showcase

This folder contains practical examples of PostgreSQL functions used for text parsing, type casting, date/time manipulation, array operations, conditional logic, and querying system metadata. Each SQL file is modular, well-commented, and structured around real-world data scenarios from the DVD Rental (Sakila) database.

---

## 📂 SQL Files

- `01_information_schema.sql` – Explore system metadata from `INFORMATION_SCHEMA` and `pg_type`
- `02_date_time_data_types.sql` – Interval arithmetic, age calculations, timestamps, and truncation with date/time
- `03_array_operations.sql` – Work with `TEXT[]` arrays using `ANY`, `@>`, index access, and conditional filters
- `04_casting_and_conversion.sql` – Use of `CAST`, `::`, `TO_CHAR()`, and implicit type conversions
- `05_text_manipulation.sql` – Concatenation, regex replacements, substrings, trimming, padding, and case transformations
- `06_pattern_matching_and_search.sql` – Text search with `LIKE`, `ILIKE`, `SIMILAR TO`, and full-text search intro
- `07_enumerated_types.sql` – Define and inspect ENUM types using `CREATE TYPE`, `pg_enum`, and metadata queries

---

## 🧪 Each SQL file demonstrates:

- 💡 **Practical use cases** from the Sakila database
- 🔧 **Function combinations** to clean and transform fields
- 📐 **Well-commented sections** for reuse in real projects
- 🧠 **Advanced logic** for parsing, data quality, or reporting

---

These exercises were developed as part of the **DataCamp course: "Functions for Manipulating Data in PostgreSQL"**, and extended with custom business logic and documentation for portfolio use.

See the `docs/` folder for technical notes and deeper explanations of topics like ENUMs, array access, and casting behaviors.

---

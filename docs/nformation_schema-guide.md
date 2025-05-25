# Guide to Using `INFORMATION_SCHEMA` in PostgreSQL

The `INFORMATION_SCHEMA` is a powerful system catalog in PostgreSQL that allows users to retrieve metadata about their database — including schemas, tables, columns, and data types. It adheres to the SQL standard, making it portable across many relational database systems.

This guide explains how to use `INFORMATION_SCHEMA` effectively for data exploration, schema inspection, and introspection queries.

---

## 📋 What Is `INFORMATION_SCHEMA`?

The `INFORMATION_SCHEMA` is a read-only set of views that provide detailed information about all objects in the current database. These views include:

* `tables`
* `columns`
* `views`
* `key_column_usage`
* `table_constraints`
* `schemata`
* ...and many more

---

## 🔎 Common Use Cases

| Task                            | View to Query                          | Description                                       |
| ------------------------------- | -------------------------------------- | ------------------------------------------------- |
| List all user tables            | `information_schema.tables`            | Lists table names, schema, and type               |
| Get column details for a table  | `information_schema.columns`           | Lists column names, data types, nullability, etc. |
| Get table constraints           | `information_schema.table_constraints` | Shows PK, FK, and UNIQUE constraints              |
| Find data types used in a table | `information_schema.columns`           | Returns type name, precision, and length          |

---

## 🧪 Example Queries

### 1. List all tables in the `public` schema

```sql
SELECT *
FROM information_schema.tables
WHERE table_schema = 'public';
```

### 2. Get column details for the `actor` table

```sql
SELECT *
FROM information_schema.columns
WHERE table_name = 'actor';
```

### 3. Show column name and data type for `customer`

```sql
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer';
```

### 4. Find all primary key constraints in `public` schema

```sql
SELECT table_name, constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'public' AND constraint_type = 'PRIMARY KEY';
```

---

## 📌 Tips and Best Practices

* Use `INFORMATION_SCHEMA` to generate dynamic SQL, build documentation, or audit your schema.
* Stick to `information_schema` views for portable queries across PostgreSQL, MySQL, SQL Server, etc.
* For PostgreSQL-specific system details (e.g., ENUM values), also explore `pg_type`, `pg_enum`, and `pg_catalog`.

---

## 🧠 When to Use `pg_catalog` Instead

While `INFORMATION_SCHEMA` provides a standard interface, PostgreSQL's `pg_catalog` system tables often expose more advanced or internal metadata:

| Use Case                  | Better Source |
| ------------------------- | ------------- |
| List ENUM values          | `pg_enum`     |
| List user-defined types   | `pg_type`     |
| View function definitions | `pg_proc`     |

For maximum compatibility, use `INFORMATION_SCHEMA`. For advanced inspection, combine with PostgreSQL system catalogs.

---

By mastering `INFORMATION_SCHEMA`, you can gain full visibility into your database structure and automate schema-driven workflows with confidence.

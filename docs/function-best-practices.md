# Function Best Practices in PostgreSQL

SQL functions are essential building blocks in both analytical pipelines and production-grade databases. This guide outlines best practices for using built-in and user-defined functions across PostgreSQL, ensuring accuracy, performance, and maintainability.

---

## 🧰 Categories of Functions

| Category             | Example Functions                      |
| -------------------- | -------------------------------------- |
| Text                 | `CONCAT`, `LEFT`, `REPLACE`, `INITCAP` |
| Numeric              | `ROUND`, `ABS`, `FLOOR`, `CEIL`        |
| Date/Time            | `AGE`, `DATE_TRUNC`, `EXTRACT`, `NOW`  |
| Conditional Logic    | `CASE`, `COALESCE`, `NULLIF`           |
| Conversion & Casting | `CAST`, `::`, `TO_CHAR`, `TO_DATE`     |
| Array                | `ANY`, `@>`, `SPLIT_PART`, `unnest()`  |
| Window               | `RANK`, `LAG`, `LEAD`, `SUM() OVER()`  |

---

## ✅ Best Practices

### 1. Always Alias Computed Columns

```sql
SELECT ROUND(price * 0.9, 2) AS discounted_price FROM product;
```

✅ Improves readability and downstream usage in tools like BI dashboards.

---

### 2. Prefer `COALESCE()` to Handle NULLs

```sql
SELECT COALESCE(phone, 'N/A') FROM customer;
```

✅ Prevents NULL propagation and unexpected empty cells.

---

### 3. Use `CASE` for Categorical Transformations

```sql
SELECT
  CASE
    WHEN rating >= 8 THEN 'High'
    WHEN rating >= 5 THEN 'Medium'
    ELSE 'Low'
  END AS rating_bucket
FROM reviews;
```

✅ Clear and explicit business logic encoding.

---

### 4. Avoid Over-Nesting: Use CTEs

```sql
WITH active_customers AS (
  SELECT customer_id FROM rental WHERE return_date IS NOT NULL
)
SELECT COUNT(*) FROM active_customers;
```

✅ Easier to debug, extend, and test.

---

### 5. Be Precise with Casting

```sql
-- Explicit casting is better than relying on implicit behavior
SELECT rental_date::date FROM rental;
```

✅ Avoids ambiguous behavior and improves query portability.

---

### 6. Use Window Functions for Analytics

```sql
SELECT customer_id,
       SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total
FROM payment;
```

✅ Cleaner than self-joins for rankings, deltas, and aggregates.

---

### 7. Use `REGEXP_REPLACE` for Robust Text Cleaning

```sql
-- Remove non-alphanumeric characters
SELECT REGEXP_REPLACE(description, '[^a-zA-Z0-9 ]', '', 'g') FROM film;
```

✅ Useful for form validations, normalization, or export cleaning.

---

### 8. Limit Scope of Transformations

Avoid mixing analytical formatting logic with business transformations. Separate reusable logic into views, CTEs, or reusable functions.

✅ Ensures modularity, testing, and scalability.

---

## ⚙️ Optimization Tips

* Use built-in functions when possible — they’re compiled and fast
* Avoid functions inside `WHERE` clauses if they prevent index usage
* Combine functions using `||`, `COALESCE`, `TRIM`, etc., for expressive formatting
* Profile long-running queries using `EXPLAIN ANALYZE`

---

## 📚 When to Use User-Defined Functions (UDFs)

* ✅ You reuse the same logic across multiple queries
* ✅ You want to encapsulate complex logic with parameters
* ✅ You want a function to return a scalar, set, or table result

```sql
CREATE OR REPLACE FUNCTION get_discount(price NUMERIC, rate NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
  RETURN price * (1 - rate);
END;
$$ LANGUAGE plpgsql;
```

---

SQL functions are the glue of transformation logic — clear naming, good formatting, and defensive coding are the keys to using them effectively across reporting and production.

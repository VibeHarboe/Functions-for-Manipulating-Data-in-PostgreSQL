# Guide to Date and Time Functions in PostgreSQL

PostgreSQL provides a rich suite of date and time functions that make it easy to perform calculations, filtering, formatting, and aggregation based on temporal data. Whether you're scheduling events, calculating durations, or extracting components from a timestamp, these functions are foundational for effective data analysis.

This guide explains the most commonly used functions — `DATE`, `INTERVAL`, `AGE()`, `DATE_TRUNC()`, and `EXTRACT()` — through real-world use cases.

---

## 🕒 Core Date/Time Functions

| Function       | Purpose                                                                 |
| -------------- | ----------------------------------------------------------------------- |
| `DATE`         | Returns the date portion of a timestamp or defines a literal date       |
| `INTERVAL`     | Represents a time duration (e.g., 5 days, 3 hours)                      |
| `AGE()`        | Returns an interval between two timestamps                              |
| `DATE_TRUNC()` | Truncates a timestamp to a specified precision (e.g., day, month, year) |
| `EXTRACT()`    | Extracts a component (e.g., year, month, dow) from a timestamp          |

---

## 🔧 Practical Examples

### 1. Add INTERVAL to calculate expected return dates

```sql
SELECT rental_date,
       rental_date + INTERVAL '3 days' AS expected_return_date
FROM rental;
```

### 2. Subtract two dates or timestamps

```sql
SELECT return_date - rental_date AS days_rented
FROM rental;
```

### 3. Use `AGE()` to calculate rental duration as interval

```sql
SELECT AGE(return_date, rental_date) AS rental_duration
FROM rental;
```

### 4. Convert integer column to interval and add

```sql
SELECT rental_date,
       INTERVAL '1 day' * rental_duration + rental_date AS expected_return_date
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id);
```

### 5. Get the current date and time

```sql
SELECT CURRENT_TIMESTAMP;      -- With time zone
SELECT NOW()::timestamp;       -- Without time zone
SELECT CURRENT_DATE;           -- Only the date
```

### 6. Truncate timestamps to time buckets

```sql
SELECT DATE_TRUNC('month', rental_date) AS rental_month
FROM rental;
```

### 7. Extract components for grouping or filtering

```sql
SELECT EXTRACT(dow FROM rental_date) AS dayofweek
FROM rental;

-- Aggregate rentals by weekday
SELECT EXTRACT(dow FROM rental_date) AS dow,
       COUNT(*) AS rentals
FROM rental
GROUP BY dow;
```

### 8. Filter on a date range using `INTERVAL`

```sql
SELECT *
FROM rental
WHERE rental_date BETWEEN DATE '2005-05-01'
                     AND DATE '2005-05-01' + INTERVAL '90 days';
```

---

## ✅ Best Practices

* Always cast dates explicitly when combining with intervals (e.g. `DATE '2023-01-01'`)
* Use `AGE()` when you want human-readable interval output (e.g. "2 years 3 mons")
* Use `EXTRACT(dow FROM timestamp)` for day-of-week patterns in behavioral analysis
* Use `DATE_TRUNC()` to simplify time-series grouping and avoid misalignment
* For timezone-aware applications, prefer `CURRENT_TIMESTAMP` over `NOW()`

---

Date and time functions in PostgreSQL are essential tools for building time-based models, scheduling systems, usage pattern analyses, and more. Learn to combine `INTERVAL`, `EXTRACT`, and aggregation to unlock powerful insights in your SQL workflows.

# Guide to PostgreSQL Array Functions

PostgreSQL supports powerful array types that allow columns to store multiple values. Arrays are useful for storing variable-length data such as tags, features, phone numbers, or JSON-like structures in a relational table without the overhead of a full join table.

This guide explains how to create, access, filter, and search arrays in PostgreSQL using functions and operators like `ARRAY[]`, indexing, `ANY`, `@>`, and `SPLIT_PART()`.

---

## 📦 Key Array Functions and Operators

| Feature / Operator | Description                                                               |
| ------------------ | ------------------------------------------------------------------------- |
| `ARRAY[]`          | Construct a PostgreSQL array literal (e.g. `ARRAY['a','b','c']`)          |
| `array[index]`     | Access a specific element of an array (1-based index)                     |
| `ANY(array)`       | Returns true if a scalar value matches any element in the array           |
| `@>`               | The "contains" operator — returns true if array includes specified values |
| `SPLIT_PART()`     | Split a delimited string into parts (often used as alternative to arrays) |

---

## 🔧 Practical Examples

### 1. View array data in a column

```sql
SELECT title, special_features
FROM film;
```

### 2. Access values by index

```sql
-- First value
SELECT title, special_features[1] AS feature
FROM film;

-- Filter films with 'Trailers' in first position
SELECT title
FROM film
WHERE special_features[1] = 'Trailers';
```

### 3. Search using `ANY`

```sql
-- Find all rows where 'Trailers' appears in any position
SELECT title
FROM film
WHERE 'Trailers' = ANY(special_features);
```

### 4. Use `@>` to check containment

```sql
-- Films that contain 'Deleted Scenes' in special_features
SELECT title
FROM film
WHERE special_features @> ARRAY['Deleted Scenes'];
```

### 5. Combine with filtering logic

```sql
-- Films that contain both 'Trailers' and 'Deleted Scenes'
SELECT title
FROM film
WHERE special_features @> ARRAY['Trailers', 'Deleted Scenes'];
```

### 6. Convert delimited strings using `SPLIT_PART()`

```sql
-- Split email into username and domain
SELECT email,
       SPLIT_PART(email, '@', 1) AS username,
       SPLIT_PART(email, '@', 2) AS domain
FROM customer;
```

---

## 🧠 Best Practices

* PostgreSQL arrays are powerful but not normalized — avoid overusing in transactional systems
* Use `ANY()` when searching a single scalar against many array elements
* Use `@>` when checking if an array contains a specific value (or set)
* Consider combining arrays with `unnest()` when transforming for reporting
* Use `SPLIT_PART()` for consistent string parsing when arrays aren't available

---

Arrays are flexible for exploratory analysis and are useful for denormalized structures like preferences, feature flags, or nested attributes. Combine indexing, `@>`, and `ANY` for expressive and performant filtering in PostgreSQL.

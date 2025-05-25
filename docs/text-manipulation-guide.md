# Text Manipulation in PostgreSQL

PostgreSQL provides a rich set of functions for manipulating string data. Whether you need to clean, format, parse, or extract substrings, mastering these text functions will empower you to handle real-world data preparation and reporting tasks efficiently.

This guide covers the most useful string functions including `CONCAT`, `LEFT`, `REPLACE`, `REGEXP_REPLACE`, `SPLIT_PART`, `POSITION()`, `INITCAP()`, and more.

---

## 🔧 Common Text Functions in PostgreSQL

| Function                     | Purpose                                    |  
| ---------------------------- | ------------------------------------------ | 
| `CONCAT()` / ||                   | Concatenate multiple strings               | 
| `LEFT(str, n)`               | Truncate string to first n characters      |  
| `REPLACE()`                  | Replace substring occurrences in text      | 
| `REGEXP_REPLACE()`           | Replace patterns using regular expressions |  
| `POSITION()`                 | Return position of substring in string     | 
| `SPLIT_PART()`               | Split string by delimiter and return part  | 
| `INITCAP()`                  | Capitalize first letter of each word       | 
| `LOWER()`/`UPPER()`          | Change case of string                      |
| `TRIM()`/`LTRIM()`/`RTRIM()` | Remove whitespace or specified characters  |

---

## 🧪 Practical Examples

### 1. Email formatting with concatenation

```sql
-- Using || operator
SELECT first_name || ' ' || last_name || ' <' || email || '>' AS full_email
FROM customer;

-- Using CONCAT()
SELECT CONCAT(first_name, ' ', last_name, ' <', email, '>') AS full_email
FROM customer;
```

### 2. Clean and pad text

```sql
-- Replace spaces with underscore
SELECT REPLACE(title, ' ', '_') AS clean_title FROM film;

-- Pad string to the right
SELECT RPAD(first_name, 15, '.') FROM customer;
```

### 3. Extract and parse substrings

```sql
-- Get username and domain from email
SELECT SPLIT_PART(email, '@', 1) AS username,
       SPLIT_PART(email, '@', 2) AS domain
FROM customer;

-- Get first 50 characters of description
SELECT LEFT(description, 50) AS short_desc FROM film;
```

### 4. Word-safe truncation

```sql
-- Truncate at 50 characters without breaking a word
SELECT LEFT(description, 50 - POSITION(' ' IN REVERSE(LEFT(description, 50)))) AS safe_desc
FROM film;
```

### 5. Regular expression cleaning

```sql
-- Remove non-alphanumeric characters
SELECT REGEXP_REPLACE(title, '[^a-zA-Z0-9 ]', '', 'g') AS clean_title
FROM film;
```

---

## 🧱 Best Practices

* Use `REGEXP_REPLACE()` for flexible data cleaning (e.g., phone numbers, punctuation)
* Always use `TRIM()` after truncation to remove whitespace
* Prefer `SPLIT_PART()` over `SUBSTRING` for delimiter-based parsing
* Use `INITCAP()` to normalize names and labels
* Use `||` for fast and readable concatenation, or `CONCAT()` for null-safe behavior

---

PostgreSQL’s text manipulation tools provide high control for parsing and cleaning string-based data. Use combinations of functions to handle complex formatting, normalization, or splitting needs for real-world applications.

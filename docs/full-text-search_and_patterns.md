# Full-text Search & Pattern Matching in PostgreSQL

PostgreSQL offers powerful tools for finding patterns and performing linguistic search across large text data. This includes simple wildcard matching with `LIKE`, full-text search via `to_tsvector` and `to_tsquery`, and regular expression capabilities like `SIMILAR TO` and `~` (regex).

This guide walks through the essentials of using pattern-based search and full-text indexing.

---

## 🔍 Pattern Matching Techniques

| Function / Operator | Description                                    |
| ------------------- | ---------------------------------------------- |
| `LIKE` / `ILIKE`    | Pattern match with `%`, `_` wildcards          |
| `SIMILAR TO`        | Enhanced pattern matching (SQL regex-like)     |
| `~` / `~*`          | POSIX regex match (case-sensitive/insensitive) |
| `!~` / `!~*`        | POSIX regex not match                          |

### Examples:

```sql
-- Basic pattern matching
SELECT title FROM film WHERE title LIKE 'A%';

-- Case-insensitive matching
SELECT title FROM film WHERE title ILIKE 'inter%';

-- Regex match: titles ending with 'man'
SELECT title FROM film WHERE title ~ 'man$';
```

---

## 🧠 Full-text Search Concepts

PostgreSQL provides `tsvector` and `tsquery` to tokenize and normalize text for fast search.

### Key Functions:

| Function            | Description                           |
| ------------------- | ------------------------------------- |
| `to_tsvector()`     | Converts text to searchable vector    |
| `to_tsquery()`      | Converts input string to search query |
| `@@`                | Match operator between vector & query |
| `plainto_tsquery()` | Simple query without boolean logic    |

### Example:

```sql
-- Find films with 'history' in description
SELECT title
FROM film
WHERE to_tsvector(description) @@ plainto_tsquery('history');
```

---

## 🧪 Combined Example with Ranking

```sql
-- Return titles ranked by relevance to 'alien invasion'
SELECT title,
       ts_rank(to_tsvector(description), plainto_tsquery('alien invasion')) AS rank
FROM film
WHERE to_tsvector(description) @@ plainto_tsquery('alien invasion')
ORDER BY rank DESC;
```

---

## 🧱 Best Practices

* ✅ Use `to_tsvector` on pre-processed data (store in indexed columns)
* ✅ Normalize text using `unaccent`, lowercase, stemming
* ✅ For flexible search, combine full-text with pattern matching
* ⚠️ Avoid `%text%` for large tables — slow without indexing

---

## 🧰 Common Use Cases

* Search across `title`, `description`, `review` columns
* Tag search or filtering in ecommerce platforms
* Autocomplete or recommendation systems
* Parsing long documents for specific entities

---

Full-text search transforms PostgreSQL into a mini search engine — powerful and native. Combine it with pattern matching and indexing for scalable, fast, and intelligent querying.

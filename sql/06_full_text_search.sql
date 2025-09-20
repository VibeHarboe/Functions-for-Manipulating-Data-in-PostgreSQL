-- #########################################################
-- Full-Text Search, Pattern Matching & Text Search Queries
-- #########################################################

-- ========================================================
-- SECTION 1: Case-insensitive pattern matching with ILIKE
-- ========================================================

-- Find all customers with 'eric' in their first name (case-insensitive)
SELECT first_name, last_name, email
FROM customer
WHERE first_name ILIKE '%eric%';

-- ========================================================
-- SECTION 2: Pattern Matching with SIMILAR TO and Regular Expressions
-- ========================================================

-- Use SIMILAR TO to match names that start with 'A' and end in 'n'
SELECT first_name
FROM customer
WHERE first_name SIMILAR TO 'A%n';

-- Use POSIX regular expressions to find last names ending in 'ez'
SELECT last_name
FROM customer
WHERE last_name ~ 'ez$';

-- Use regex replace to remove punctuation from email addresses
SELECT email,
       REGEXP_REPLACE(email, '[^\w@.]', '', 'g') AS clean_email
FROM customer;

-- ========================================================
-- SECTION 3: Full-Text Search with to_tsvector and to_tsquery
-- ========================================================

-- Search for descriptions containing both 'action' and 'hero'
SELECT title, description
FROM film
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'action & hero');

-- Return the top 10 most searchable films
SELECT title,
       ts_rank(to_tsvector('english', description), to_tsquery('english', 'hero')) AS rank
FROM film
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'hero')
ORDER BY rank DESC
LIMIT 10;

-- Highlight matching lexemes using ts_headline
SELECT title,
       ts_headline('english', description, to_tsquery('english', 'hero')) AS highlighted_desc
FROM film
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'hero')
LIMIT 5;

-- ========================================================
-- SECTION 4: Phrase search and negation with tsquery
-- ========================================================

-- Search for descriptions with 'epic' but not 'love'
SELECT title, description
FROM film
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'epic & !love');

-- Search for phrase: 'space war'
SELECT title
FROM film
WHERE to_tsvector('english', description) @@ phraseto_tsquery('english', 'space war');

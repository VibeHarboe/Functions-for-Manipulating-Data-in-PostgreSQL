-- #########################################################
-- 05_text_manipulation.sql
-- Advanced string manipulation using PostgreSQL functions
-- #########################################################

-- ========================================================
-- SECTION 1: Email Formatting – Concatenation & Padding
-- ========================================================

-- A. Using || operator
SELECT 
  first_name || ' ' || last_name || ' <' || email || '>' AS full_email
FROM customer;

-- B. Using CONCAT() function
SELECT 
  CONCAT(first_name, ' ', last_name, ' <', email, '>') AS full_email
FROM customer;

-- C. Using RPAD/LPAD for alignment
SELECT 
  RPAD(first_name, LENGTH(first_name)+1) ||
  RPAD(last_name, LENGTH(last_name)+2, ' <') ||
  RPAD(email, LENGTH(email)+1, '>') AS padded_email
FROM customer;


-- ========================================================
-- SECTION 2: Replace Whitespace in Text
-- ========================================================

-- Replace all spaces in film titles with underscores
SELECT 
  REPLACE(title, ' ', '_') AS title
FROM film;


-- ========================================================
-- SECTION 3: Determine Length of Text Field
-- ========================================================

-- Get number of characters in the description column
SELECT 
  title,
  description,
  CHAR_LENGTH(description) AS desc_len
FROM film
LIMIT 100;


-- ========================================================
-- SECTION 4: Truncating Description – Simple, Trimmed, and Smart
-- ========================================================

-- A. Simple LEFT truncation
SELECT 
  LEFT(description, 50) AS short_desc
FROM film;

-- B. Trim whitespace after truncation
SELECT 
  TRIM(LEFT(description, 50)) AS trimmed_desc
FROM film;

-- C. Smart truncation at word boundary using REVERSE and POSITION
SELECT 
  UPPER(c.name) || ': ' || f.title AS film_category, 
  LEFT(f.description, 50 - POSITION(' ' IN REVERSE(LEFT(f.description, 50)))) AS film_desc
FROM 
  film AS f 
  INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
  INNER JOIN category AS c ON fc.category_id = c.category_id;


-- ========================================================
-- SECTION 5: Extract Street Names from Full Address
-- ========================================================

-- Remove street number and return only the street name portion of the address
SELECT 
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR CHAR_LENGTH(address)) AS street_name
FROM address;


-- ========================================================
-- SECTION 6: Email Parsing – SUBSTRING vs SPLIT_PART
-- ========================================================

-- A. Using SUBSTRING to extract username and domain
SELECT
  SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1) AS username_sub,
  SUBSTRING(email FROM POSITION('@' IN email)+1 FOR CHAR_LENGTH(email)) AS domain_sub
FROM customer;

-- B. Using SPLIT_PART to extract username and domain
SELECT 
  email,
  SPLIT_PART(email, '@', 1) AS username_part,
  SPLIT_PART(email, '@', 2) AS domain_part
FROM customer;

-- TIP: POSITION('@' IN email) returns the numeric index of '@'.
-- SPLIT_PART(email, '@', n) directly extracts the substring by delimiter.
-- POSITION is useful for character offset logic, while SPLIT_PART simplifies splitting into structured parts.


-- ========================================================
-- SECTION 7: Cleanse Text Using REGEXP_REPLACE
-- ========================================================

-- Remove all non-alphanumeric characters from title
SELECT 
  title,
  REGEXP_REPLACE(title, '[^a-zA-Z0-9 ]', '', 'g') AS cleaned_title
FROM film;


-- ========================================================
-- SECTION 8: Additional String Functions – POSITION, REVERSE, INITCAP
-- ========================================================

-- A. Get position of '@' in email
SELECT email, POSITION('@' IN email) AS at_pos FROM customer;

-- B. Reverse string data (for matching or trimming from end)
SELECT title, REVERSE(title) AS reversed_title FROM film;

-- C. Convert to title case (initcap)
SELECT title, INITCAP(title) AS title_case FROM film;

-- D. Category in UPPER and film title in INITCAP
SELECT 
  CONCAT(UPPER(c.name), ': ', INITCAP(f.title)) AS formatted_title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

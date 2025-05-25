-- #########################################################
-- 05_text_manipulation.sql
-- Advanced string manipulation using PostgreSQL functions
-- #########################################################

-- ========================================================
-- SECTION 1: String Concatenation – Email Formatting
-- ========================================================

-- Format example: Brian Piccolo <bpiccolo@datacamp.com>
-- Using || operator to build full email
SELECT 
  first_name, 
  last_name,
  first_name || ' ' || last_name || ' <' || email || '>' AS full_email
FROM customer;

-- Same logic using CONCAT() function
SELECT 
  CONCAT(first_name, ' ', last_name, ' <', email, '>') AS full_email
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
FROM film;


-- ========================================================
-- SECTION 4: Truncate Description to 50 Characters
-- ========================================================

-- Get first 50 characters of the description column
SELECT 
  LEFT(description, 50) AS short_desc
FROM film AS f;


-- ========================================================
-- SECTION 5: Extract Street Names from Full Address
-- ========================================================

-- Remove street number and return only the street name portion of the address
SELECT 
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR CHAR_LENGTH(address)) AS street_name
FROM address;


-- ========================================================
-- SECTION 6: Split Email Address into Username and Domain
-- ========================================================

-- Extract username and domain from email column
SELECT
  SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1) AS username,
  SUBSTRING(email FROM POSITION('@' IN email)+1 FOR CHAR_LENGTH(email)) AS domain
FROM customer;


-- ========================================================
-- SECTION 7: Padding Strings with RPAD and LPAD
-- ========================================================

-- Subsection A: Pad first_name right and concatenate with last_name
SELECT 
  RPAD(first_name, LENGTH(first_name)+1) || last_name AS full_name
FROM customer;

-- Subsection B: Pad last_name left and concatenate with first_name
SELECT 
  first_name || LPAD(last_name, LENGTH(last_name)+1) AS full_name
FROM customer;

-- Subsection C: Pad name and email fields with spacing and delimiters
SELECT 
  RPAD(first_name, LENGTH(first_name)+1) ||
  RPAD(last_name, LENGTH(last_name)+2, ' <') ||
  RPAD(email, LENGTH(email)+1, '>') AS full_email
FROM customer;


-- ========================================================
-- SECTION 8: Trim Whitespace After Truncation
-- ========================================================

-- Cleanly format category + title and truncated/trimmed description
SELECT 
  CONCAT(UPPER(c.name), ': ', f.title) AS film_category,
  TRIM(LEFT(f.description, 50)) AS film_desc
FROM 
  film AS f
  INNER JOIN film_category AS fc ON f.film_id = fc.film_id
  INNER JOIN category AS c ON fc.category_id = c.category_id;


-- ========================================================
-- SECTION 9: Truncate Without Breaking Words – Smart Truncation
-- ========================================================

-- Advanced: Truncate description before 50 characters at the last full word boundary
SELECT 
  UPPER(c.name) || ': ' || f.title AS film_category, 
  LEFT(f.description, 50 - POSITION(' ' IN REVERSE(LEFT(f.description, 50)))) AS film_desc
FROM 
  film AS f 
  INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
  INNER JOIN category AS c ON fc.category_id = c.category_id;


-- ========================================================
-- SECTION 10: Cleanse Text Using REGEXP_REPLACE
-- ========================================================

-- Remove all non-alphanumeric characters from title
SELECT 
  title,
  REGEXP_REPLACE(title, '[^a-zA-Z0-9 ]', '', 'g') AS cleaned_title
FROM film;


-- ========================================================
-- SECTION 11: Split String with SPLIT_PART()
-- ========================================================

-- Extract domain from email using SPLIT_PART
SELECT 
  email,
  SPLIT_PART(email, '@', 1) AS username,
  SPLIT_PART(email, '@', 2) AS domain
FROM customer;

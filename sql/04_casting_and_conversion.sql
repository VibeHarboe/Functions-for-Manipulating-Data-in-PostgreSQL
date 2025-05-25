-- #########################################################
-- String concatenation, type casting, and format transformation
-- #########################################################

-- ========================================================
-- SECTION 1: String Concatenation with ||
-- ========================================================

-- Format: Brian Piccolo <bpiccolo@datacamp.com>
-- Concatenate first_name, last_name, and email with delimiters
SELECT 
  first_name, 
  last_name,
  first_name || ' ' || last_name || ' <' || email || '>' AS full_email 
FROM customer;


-- ========================================================
-- SECTION 2: String Concatenation with CONCAT()
-- ========================================================

-- Same output using PostgreSQL CONCAT() function
SELECT 
  CONCAT(first_name, ' ', last_name, ' <', email, '>') AS full_email
FROM customer;


-- ========================================================
-- SECTION 3: Changing Case and Concatenating Film Info
-- ========================================================

-- Create film_category field combining uppercase category and title-cased title
-- Also convert description to lowercase for normalization
SELECT 
  UPPER(c.name) || ': ' || INITCAP(f.title) AS film_category,
  LOWER(f.description) AS description
FROM 
  film AS f
  INNER JOIN film_category AS fc ON f.film_id = fc.film_id
  INNER JOIN category AS c ON fc.category_id = c.category_id;

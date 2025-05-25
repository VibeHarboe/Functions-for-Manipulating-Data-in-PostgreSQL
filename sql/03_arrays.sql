-- #########################################################
-- 03_arrays.sql
-- Working with ARRAY data types in PostgreSQL
-- Includes access, filtering, and advanced search logic
-- #########################################################


-- ========================================================
-- SECTION 1: Viewing ARRAY contents – special_features column
-- ========================================================

-- Inspect TEXT[] array structure in film table
SELECT 
  title, 
  special_features 
FROM film;


-- ========================================================
-- SECTION 2: Accessing values by index
-- ========================================================

-- Check if first element in array is 'Trailers'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features[1] = 'Trailers';

-- Check if second element is 'Deleted Scenes'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features[2] = 'Deleted Scenes';


-- ========================================================
-- SECTION 3: Search ARRAY using @> (contains)
-- ========================================================

-- Find all films where special_features contains 'Deleted Scenes'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features @> ARRAY['Deleted Scenes']::TEXT[];


-- ========================================================
-- SECTION 4: Search ARRAY using ANY
-- ========================================================

-- Find all films where 'Trailers' appears anywhere in array
SELECT 
  title, 
  special_features 
FROM film
WHERE 'Trailers' = ANY(special_features);


-- ========================================================
-- SECTION 5: BONUS – Combine filters for multiple values
-- ========================================================

-- Find films that contain both 'Trailers' and 'Behind the Scenes'
SELECT 
  title,
  special_features
FROM film
WHERE special_features @> ARRAY['Trailers', 'Behind the Scenes']::TEXT[];

-- Alternative: find all films that contain EITHER value
SELECT 
  title,
  special_features
FROM film
WHERE special_features && ARRAY['Trailers', 'Behind the Scenes']::TEXT[];

-- `@>` = contains all
-- `&&` = overlaps with any

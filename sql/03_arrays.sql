-- #########################################################
-- Accessing and Filtering PostgreSQL ARRAY Values
-- #########################################################

-- ========================================================
-- SECTION 1: Explore the ARRAY Column `special_features`
-- ========================================================

-- View title and its associated array of special features
SELECT 
  title, 
  special_features 
FROM film;


-- ========================================================
-- SECTION 2: Filter by First Array Value = 'Trailers'
-- ========================================================

-- Filter films where the first array element is 'Trailers'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features[1] = 'Trailers';


-- ========================================================
-- SECTION 3: Filter by Second Array Value = 'Deleted Scenes'
-- ========================================================

-- Filter films where the second array element is 'Deleted Scenes'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features[2] = 'Deleted Scenes';


-- ========================================================
-- SECTION 4: Search ARRAY using ANY()
-- ========================================================

-- Return films where 'Trailers' exists in any index of the array
SELECT 
  title, 
  special_features 
FROM film
WHERE 'Trailers' = ANY(special_features);


-- ========================================================
-- SECTION 5: Search ARRAY using @> (contains operator)
-- ========================================================

-- Return films where the special_features array contains 'Deleted Scenes'
SELECT 
  title, 
  special_features 
FROM film
WHERE special_features @> ARRAY['Deleted Scenes']::text[];

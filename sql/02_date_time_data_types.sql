-- #########################################################
-- PostgreSQL date/time functions for transformation, logic,
-- and interval arithmetic in business scenarios
-- #########################################################

-- ========================================================
-- SECTION 1: Add INTERVAL to rental_date → expected return
-- ========================================================

-- Calculate expected return date by adding 3-day interval to rental_date
SELECT
  rental_date,
  return_date,
  rental_date + INTERVAL '3 Days' AS expected_return_date
FROM rental;


-- ========================================================
-- SECTION 2–4: Rental duration calculations (int vs interval)
-- ========================================================

-- Subtracting return_date - rental_date gives integer days rented
SELECT f.title, f.rental_duration,
       r.return_date - r.rental_date AS days_rented
FROM film AS f
  INNER JOIN inventory AS i ON f.film_id = i.film_id
  INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- AGE() returns interval type instead of number (e.g. "3 days")
SELECT f.title, f.rental_duration,
       AGE(r.return_date, r.rental_date) AS days_rented
FROM film AS f
  INNER JOIN inventory AS i ON f.film_id = i.film_id
  INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- Convert rental_duration into interval and add to rental_date
SELECT f.title, r.rental_date, f.rental_duration,
       INTERVAL '1' day * f.rental_duration + r.rental_date AS expected_return_date,
       r.return_date
FROM film AS f
  INNER JOIN inventory AS i ON f.film_id = i.film_id
  INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;


-- ========================================================
-- SECTION 5–6: Working with current date/time & casting
-- ========================================================

-- CURRENT_TIMESTAMP includes timezone; ::timestamp removes it
SELECT CURRENT_TIMESTAMP::timestamp AS right_now;

-- Add interval to current timestamp
SELECT CURRENT_TIMESTAMP::timestamp AS right_now,
       INTERVAL '5 days' + CURRENT_TIMESTAMP AS five_days_from_now;

-- Use fractional second precision
SELECT CURRENT_TIMESTAMP(2)::timestamp AS right_now,
       INTERVAL '5 days' + CURRENT_TIMESTAMP(2) AS five_days_from_now;

-- Use CURRENT_DATE and cast NOW() to date
SELECT CURRENT_DATE, CAST(NOW() AS date);


-- ========================================================
-- SECTION 7: Extract weekday from rental_date
-- ========================================================

-- Extract day of week (0 = Sunday, 6 = Saturday)
SELECT EXTRACT(dow FROM rental_date) AS dayofweek
FROM rental
LIMIT 100;

-- Aggregate number of rentals per day of week
SELECT EXTRACT(dow FROM rental_date) AS dayofweek,
       COUNT(*) AS rentals
FROM rental
GROUP BY 1;


-- ========================================================
-- SECTION 8: Truncating dates to group time
-- ========================================================

-- Truncate rental_date to year
SELECT DATE_TRUNC('year', rental_date) AS rental_year
FROM rental;

-- Truncate rental_date to month
SELECT DATE_TRUNC('month', rental_date) AS rental_month
FROM rental;

-- Truncate rental_date to day
SELECT DATE_TRUNC('day', rental_date) AS rental_day
FROM rental;

-- Count rentals per day
SELECT DATE_TRUNC('day', rental_date) AS rental_day,
       COUNT(*) AS rentals
FROM rental
GROUP BY 1;


-- ========================================================
-- SECTION 9: Combining EXTRACT, AGE, CASE and JOINs
-- ========================================================

-- Use case: track overdue rentals per customer across a 90-day window
-- Great for predictive model training (e.g. late return probability)

SELECT 
  c.first_name || ' ' || c.last_name AS customer_name,
  f.title,
  r.rental_date,
  EXTRACT(dow FROM r.rental_date) AS dayofweek,
  AGE(r.return_date, r.rental_date) AS rental_days,
  -- Check if actual rental exceeded allowed rental duration
  CASE 
    WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >
         f.rental_duration * INTERVAL '1 day'
    THEN TRUE 
    ELSE FALSE 
  END AS past_due
FROM film AS f
  INNER JOIN inventory AS i ON f.film_id = i.film_id
  INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
  INNER JOIN customer AS c ON c.customer_id = r.customer_id
WHERE r.rental_date BETWEEN DATE '2005-05-01'
                        AND DATE '2005-05-01' + INTERVAL '90 day';


-- ========================================================
-- SECTION 10: Create ENUM type for user-defined values
-- ========================================================

-- Create an enumerated data type, compass_position
CREATE TYPE compass_position AS ENUM (
  'North', 
  'South',
  'East', 
  'West'
);

-- Confirm the new data type is in the pg_type system table
SELECT *
FROM pg_type
WHERE typname = 'compass_position';

-- Optionally inspect valid ENUM values from pg_enum
SELECT e.enumlabel
FROM pg_type t
JOIN pg_enum e ON t.oid = e.enumtypid
WHERE t.typname = 'compass_position';


-- ========================================================
-- SECTION 11: Inspect existing enum column → mpaa_rating
-- ========================================================

-- Use INFORMATION_SCHEMA to inspect column and type metadata
SELECT column_name, data_type, udt_name
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'film' AND column_name = 'rating';

-- View the enum definition for mpaa_rating
SELECT *
FROM pg_type 
WHERE typname = 'mpaa_rating';

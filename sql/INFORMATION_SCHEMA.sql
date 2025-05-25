-- #########################################################
-- Exploring Metadata with INFORMATION_SCHEMA
-- & Understanding PostgreSQL Common Data Types
-- #########################################################

-- ========================================================
-- SECTION 1: List All Public Tables in the Database
-- ========================================================

-- Use the INFORMATION_SCHEMA to inspect all tables and views
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = 'public';


-- ========================================================
-- SECTION 2: Inspect Table Columns (e.g., 'actor')
-- ========================================================

-- View column metadata such as name, data type, nullable
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'actor';


-- ========================================================
-- SECTION 3: Check Data Types of Specific Columns (e.g., Film table)
-- ========================================================

-- Understand column types: TEXT, VARCHAR, ARRAY, etc.
SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE column_name IN ('title', 'description', 'special_features')
  AND table_name = 'film';


-- ========================================================
-- SECTION 4: Check Date/Time Column Types (e.g., Rental Date)
-- ========================================================

-- View the data type of timestamp/datetime fields
SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE column_name = 'rental_date'
  AND table_name = 'rental';


-- ========================================================
-- SECTION 5: Check Data Types in the Customer Table
-- ========================================================

-- View all column names and their data types for 'customer'
SELECT column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'customer';

/*
=========================================================================
Quality Checks
=========================================================================
Script Purpose:
    This script performs various quality checks for data consistency,
    accuracy, and standardzation across the 'silver' schemas.
    It includes checks for:
    - Null or Duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data Standardization and consistency.
    - Invalid date ranges and outliers.
    - Data Consistency between related fields.

Usage Notes:
    - Run these checks after loading data into Silver layer.
    - Investigate and resolve any discrepancies found during the checks.
=========================================================================
*/

-- ====================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================
-- Check For NULLS or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
	cst_id,
	COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1 OR cst_id IS NULL
GO

-- Check For Unwanted Spaces
-- Expectation: No Results
SELECT 
    cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname <> TRIM(cst_firstname)
GO

SELECT 
    cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname <> TRIM(cst_lastname)
GO

-- Data Standardization & Consistency
SELECT DISTINCT 
    cst_gndr
FROM silver.crm_cust_info
GO

SELECT DISTINCT 
    cst_marital_status
FROM silver.crm_cust_info
GO

-- Looking at the whole table
SELECT * FROM silver.crm_cust_info

-- ====================================================
-- Checking 'silver.crm_prd_info'
-- ====================================================
-- Check For NULLS or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL
GO

-- Check For Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm <> TRIM(prd_nm)
GO

-- CHECK for NULLs or Negative Numbers in Product Cost
-- Expectation: No Results
SELECT 
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL
GO 

-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line
FROM silver.crm_prd_info
GO

-- Check for Invalid Date Orders
-- >> End_date must not be earlier than the start date.
-- Expectations: No results
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt
GO

-- Looking at the whole table
SELECT * FROM silver.crm_prd_info

-- ====================================================
-- Checking 'silver.crm_sales_details'
-- ====================================================
-- Check for Invalid Dates
-- Expectations: No Invalid Dates and No Outliers
-- Check for outliers by validating the boundaries of the date range.             
SELECT 
    sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0
       OR LEN(sls_order_dt) <> 8
       OR sls_order_dt > 20500101
       OR sls_order_dt < 19000101;
GO


SELECT 
    sls_ship_dt, 0
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0
       OR LEN(sls_ship_dt) <> 8
       OR sls_ship_dt > 20500101
       OR sls_ship_dt < 19000101;
GO


SELECT 
    sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
       OR LEN(sls_due_dt) <> 8
       OR sls_due_dt > 20500101
       OR sls_due_dt < 19000101;
GO


-- Check for Invalid Date Orders 
-- >> Order date < Shipping date < Due date
-- Expectation: No results
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
       OR sls_order_dt > sls_due_dt
       OR sls_ship_dt > sls_due_dt;
GO


-- Check Data Consistency : Sales = Quantity * Price 
-- >> Values must not be NULL, zero, or negative.
-- Expectation: No results
SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales <> sls_quantity * sls_price
       OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
       OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price
GO 

-- Looking at the whole table
SELECT * FROM silver.crm_sales_details

-- ====================================================
-- Checking 'silver.erp_cust_az12'
-- ====================================================
-- Identify Out-of-Range Dates (Outliers)
-- Expectation: Birthdates should between 1925-01-01 and present date.
SELECT DISTINCT 
	bdate
FROM silver.erp_cust_az12
WHERE bdate < '1925-01-01'
	OR bdate > GETDATE()
GO

-- Data Standardization & Consistency
SELECT DISTINCT 
    gen
FROM silver.erp_cust_az12
GO

-- Looking at the whole table
SELECT * FROM silver.erp_cust_az12

-- ====================================================
-- Checking 'silver.erp_loc_a101'
-- ====================================================
-- Data Standardization & Consistency
SELECT DISTINCT 
    cntry
FROM silver.erp_loc_a101
ORDER BY cntry

-- Looking at the whole table
SELECT * FROM silver.erp_loc_a101

-- ====================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ====================================================
-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE cat <> TRIM(cat)
	OR subcat <> TRIM(subcat)
	OR maintenance <> TRIM(maintenance)
GO 

-- Data Standardization & Consistency
SELECT DISTINCT 
	cat
FROM silver.erp_px_cat_g1v2
GO 

SELECT DISTINCT 
	subcat
FROM silver.erp_px_cat_g1v2
GO 

SELECT DISTINCT 
	maintenance
FROM silver.erp_px_cat_g1v2
GO 

-- Looking at the whole table
SELECT * FROM silver.erp_px_cat_g1v2

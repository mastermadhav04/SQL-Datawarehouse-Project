/*
===============================================================================
Quality Checks For the Gold Layer Views
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency,
    and accuracy of the Gold layer. These checks ensure:
    - Uniqueness of surrogate keys in the dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks after creating views in the 'gold' layer.
    - Investigate and resolve any discrepancies found during the checks.

Remember to edit the script if any new quality check is added to the layer.
===============================================================================
*/

-- ============================================================================
-- Checking 'gold.dim_customers'
-- ============================================================================
-- Check for Uniqueness of Customer Key in gold.dim_customers
-- Expecation: No results
SELECT 
	customer_key,
	COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ============================================================================
-- Checking 'gold.dim_products'
-- ============================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expecation: No results
SELECT 
	product_key,
	COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ============================================================================
-- Checking 'gold.fact_sales'
-- ============================================================================
-- Check the data model connectivity betweem fact and dimensions (Foreign Key Integrity)
-- Expectation: No results
SELECT 
	s.order_number,
	s.product_key AS sales_product_key,
	s.customer_key AS sales_customer_key
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
	ON s.customer_key = c.customer_key
LEFT JOIN gold.dim_products p
	ON s.product_key = p.product_key
WHERE c.customer_key IS NULL 
	OR p.product_key IS NULL;

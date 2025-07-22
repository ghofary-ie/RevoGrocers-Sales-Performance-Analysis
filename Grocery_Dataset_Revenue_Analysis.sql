-- Grocery Dataset Revenue Analysis
-- Objective:
-- 1. Identify top-performing product categories
-- 2. Analyze factors driving revenue (units sold vs. customer count)
-- 3. Evaluate pricing strategies and their impact on sales
--
-- This query calculates the number of transactions and total revenue per customer
-- It uses quantity and product pricing from joined datasets to manually compute revenue,
-- since the original TotalPrice field contains only zeros.
--
-- Final Result:
-- CustomerID 94800 had 103 transactions with a total revenue of $134,409.83

-- [Your queries follow here...]
-- -- Question 1: ﻿Identify the product category that generates the highest revenue after discount.

-- SELECT 
--     c.categoryname,
--     Round(SUM(p.price * (1 - COALESCE(s.Discount, 0)) * s.Quantity), 2) AS total_revenue_after_discount
-- FROM 
--     `fsda-sql-01.grocery_dataset.sales` s
-- JOIN 
--     `fsda-sql-01.grocery_dataset.products` p
--     ON s.ProductID = p.productid
-- JOIN
--     `fsda-sql-01.grocery_dataset.categories` c
--     ON p.categoryid = c.categoryid
-- GROUP BY 
--     c.categoryname
-- ORDER BY 
--     total_revenue_after_discount DESC
-- LIMIT 1;

...

-- Questions 9`: Find the cumulative amount of transaction of the top user (user with highest transaction value)

-- WITH transaction_totals AS (
--   SELECT
--     customerid,
--     TransactionNumber
--   FROM
--     `fsda-sql-01.grocery_dataset.sales`
-- )

-- SELECT
--   s.customerid,
--   COUNT(DISTINCT s.TransactionNumber) AS total_transactions,
--   ROUND(SUM(s.Quantity * p.price), 2) AS total_revenue
-- FROM
--   `fsda-sql-01.grocery_dataset.sales` s
-- JOIN
--   `fsda-sql-01.grocery_dataset.products` p
-- ON
--   s.ProductID = p.productid
-- GROUP BY
--   s.customerid
-- ORDER BY
--   total_revenue DESC
-- LIMIT 1;

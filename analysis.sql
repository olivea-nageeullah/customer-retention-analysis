-- =====================================================
-- CUSTOMER RETENTION & REVENUE ANALYSIS
-- =====================================================

-- ---------------------------------
-- 1. Total Revenue
-- ---------------------------------

SELECT SUM(quantity * unit_price) AS total_revenue
FROM online_retail
WHERE quantity > 0 AND unit_price > 0;

-- ---------------------------------
-- 2. Unique Customers
-- ---------------------------------

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM online_retail
WHERE customer_id IS NOT NULL;

-- ---------------------------------
-- 3. Average Order Value
-- ---------------------------------

SELECT AVG(order_revenue)
FROM (
    SELECT invoice_no,
           SUM(quantity * unit_price) AS order_revenue
    FROM online_retail
    GROUP BY invoice_no
) t;

-- ---------------------------------
-- 4. Revenue by Country
-- ---------------------------------

SELECT country,
       SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY country
ORDER BY revenue DESC;

-- ---------------------------------
-- 5. Top Customers
-- ---------------------------------

SELECT customer_id,
       SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY customer_id
ORDER BY revenue DESC;

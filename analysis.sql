-- Customer Retention & Revenue Analysis

-- 1. Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM online_retail
WHERE quantity > 0 AND unit_price > 0;

-- 2. Unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM online_retail;

-- 3. Average order value
SELECT AVG(order_revenue)
FROM (
    SELECT invoice_no,
           SUM(quantity * unit_price) AS order_revenue
    FROM online_retail
    GROUP BY invoice_no
) t;

-- 4. Revenue by country
SELECT country,
       SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY country
ORDER BY revenue DESC;

-- 5. Revenue by customer
SELECT customer_id,
       SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY customer_id
ORDER BY revenue DESC;

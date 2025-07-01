-- 1. Total revenue generated
SELECT SUM(amount) AS total_revenue FROM sales;

-- 2. Total number of orders
SELECT COUNT(order_id) AS total_orders FROM sales;

-- 3. Monthly revenue
SELECT 
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 4. Monthly order count
SELECT 
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales
GROUP BY month
ORDER BY month;

-- 5. Revenue per product
SELECT 
    product_id,
    SUM(amount) AS revenue_per_product
FROM sales
GROUP BY product_id
ORDER BY revenue_per_product DESC;

-- 6. Number of orders per product
SELECT 
    product_id,
    COUNT(order_id) AS orders_per_product
FROM sales
GROUP BY product_id;

-- 7. Highest single order value
SELECT * 
FROM sales 
ORDER BY amount DESC 
LIMIT 1;

-- 8. Average order value
SELECT AVG(amount) AS avg_order_value FROM sales;

-- 9. Orders in 2024 only
SELECT * 
FROM sales 
WHERE YEAR(order_date) = 2024;

-- 10. Revenue generated per month (with month names)
SELECT 
    DATE_FORMAT(order_date, '%M') AS month_name,
    SUM(amount) AS monthly_revenue
FROM sales
GROUP BY month_name
ORDER BY STR_TO_DATE(month_name, '%M');

-- 11. Revenue comparison: Jan vs Feb
SELECT 
    MONTH(order_date) AS month,
    SUM(amount) AS revenue
FROM sales
WHERE MONTH(order_date) IN (1, 2)
GROUP BY month;

-- 12. Top 2 products with highest revenue
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 2;

-- 13. Revenue distribution by quarter
SELECT 
    QUARTER(order_date) AS quarter,
    SUM(amount) AS quarterly_revenue
FROM sales
GROUP BY quarter;

-- 14. Count of orders above ₹200
SELECT COUNT(*) AS big_orders 
FROM sales 
WHERE amount > 200;

-- 15. Orders sorted by order date (oldest to newest)
SELECT * 
FROM sales
ORDER BY order_date ASC;

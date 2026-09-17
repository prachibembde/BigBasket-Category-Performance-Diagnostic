-- 01_foundations.sql
-- 1. SELECT / WHERE: orders from a specific city
SELECT o.*
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE c.city = 'Pune';

-- 2. DISTINCT: every category
SELECT DISTINCT category
FROM products
ORDER BY category;

-- 3. ORDER BY + LIMIT: five highest-value orders
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. Alias (AS)
SELECT COUNT(*) AS total_orders
FROM orders;

-- 5. IN: orders using two payment modes
SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');

-- 6. BETWEEN: orders within a stated revenue range
SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;

-- 7. NOT BETWEEN: orders outside the same range
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;

-- 8. IS NULL: orders with no rating
SELECT *
FROM orders
WHERE rating IS NULL;

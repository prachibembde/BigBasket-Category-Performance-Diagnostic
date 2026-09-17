-- 02_aggregation_joins.sql
-- 1. INNER JOIN + GROUP BY + HAVING: delivered revenue by category
SELECT
    p.category,
    COUNT(o.order_id) AS delivered_orders,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC;

-- 2. LEFT JOIN: all products, including the zero-order product
SELECT
    p.product_name,
    p.category,
    COUNT(o.order_id) AS total_orders
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_orders ASC, p.product_name;

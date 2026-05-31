WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(order_date), '%Y-%m') AS cohort_month
    FROM orders
    GROUP BY customer_id
)

SELECT
    o.customer_id,
    o.order_date,
    fp.cohort_month
FROM orders o
JOIN first_purchase fp
ON o.customer_id = fp.customer_id;


-- revenue analysis

-- monthly revenue trend 
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS month_name,
    ROUND(SUM(total_amount_usd),2) AS revenue
FROM orders
GROUP BY month_name
ORDER BY month_name;

-- revenue by category
SELECT
    category,
    ROUND(SUM(total_amount_usd),2) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;

-- revenue by membership tier
SELECT
    c.membership_tier,
    ROUND(SUM(o.total_amount_usd),2) AS revenue,
    COUNT(DISTINCT c.customer_id) AS customers
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.membership_tier
ORDER BY revenue DESC;

-- product analysi

-- top 10 product by revenue 
SELECT
    product_name,
    ROUND(SUM(total_amount_usd),2) AS revenue
FROM orders
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- category performance
SELECT
    category,
    COUNT(*) AS orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(total_amount_usd),2) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;
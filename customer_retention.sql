-- retention rate

SELECT
    ROUND(
        (COUNT(*) - SUM(churned)) * 100.0 / COUNT(*),
        2
    ) AS retention_rate
FROM customers;

-- churn rate
SELECT
    ROUND(
        AVG(churned) * 100,
        2
    ) AS churn_rate
FROM customers;

-- retention by membership tier

SELECT
    membership_tier,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churned = 0 THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        SUM(CASE WHEN churned = 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS retention_rate
FROM customers
GROUP BY membership_tier
ORDER BY retention_rate DESC;


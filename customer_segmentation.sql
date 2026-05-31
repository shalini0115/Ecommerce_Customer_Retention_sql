SELECT
membership_tier,
COUNT(*) customers,
AVG(total_spend_usd)
FROM customers
GROUP BY membership_tier;

SELECT
acquisition_channel,
COUNT(*),
AVG(total_spend_usd)
FROM customers
GROUP BY acquisition_channel;

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    COUNT(*) AS customers,
    ROUND(AVG(total_spend_usd), 2) AS avg_spend
FROM customers
GROUP BY age_group
ORDER BY age_group;


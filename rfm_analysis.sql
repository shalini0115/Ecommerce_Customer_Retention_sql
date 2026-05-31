WITH rfm AS (
    SELECT
        customer_id,
        DATEDIFF(
            (SELECT MAX(order_date) FROM orders),
            MAX(order_date)
        ) AS recency,
        COUNT(order_id) AS frequency,
        SUM(total_amount_usd) AS monetary
    FROM orders
    GROUP BY customer_id
),

rfm_scores AS (
    SELECT
        customer_id,
        recency,
        frequency,
        monetary,

        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score

    FROM rfm
)

SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,

    CASE
        WHEN r_score >= 4
         AND f_score >= 4
         AND m_score >= 4
            THEN 'Champions'

        WHEN r_score >= 3
         AND f_score >= 3
         AND m_score >= 3
            THEN 'Loyal Customers'

        WHEN r_score >= 4
         AND f_score <= 2
            THEN 'Potential Loyalists'

        WHEN r_score <= 2
         AND f_score >= 3
            THEN 'At Risk'

        ELSE 'Lost Customers'
    END AS segment

FROM rfm_scores;

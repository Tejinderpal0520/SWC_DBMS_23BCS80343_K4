WITH avg_scores AS (
    SELECT 
        employee_id,
        employee_name,
        AVG(customer_satisfaction) AS avg_score
    FROM amazon_support_tickets
    WHERE resolution_status = 'resolved'
    GROUP BY employee_id, employee_name
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY avg_score DESC) AS rnk
    FROM avg_scores
)

SELECT 
    employee_id,
    employee_name,
    avg_score,
    rnk
FROM ranked
WHERE rnk <= 3;
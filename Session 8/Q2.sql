WITH distinct_salaries AS (
    SELECT DISTINCT department, salary
    FROM twitter_employee
),
ranked AS (
    SELECT 
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department 
            ORDER BY salary DESC
        ) AS rnk
    FROM distinct_salaries
)

SELECT 
    department,
    salary
FROM ranked
WHERE rnk <= 3
ORDER BY department ASC, salary DESC;
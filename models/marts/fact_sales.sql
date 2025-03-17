WITH final_sales AS (
    SELECT *
    FROM {{ ref('int_sales') }}
)

SELECT * FROM final_sales

WITH final_products AS (
    SELECT *
    FROM {{ ref('int_products') }}
)

SELECT * FROM final_products

WITH raw_products AS (
    SELECT * FROM {{ source('erp_aw', 'product') }}
)

SELECT
    CAST(productid AS INT) AS pk_product,
    name AS product_name,
    color AS product_color,
    listprice AS product_price,
    modifieddate AS updated_at
FROM raw_products
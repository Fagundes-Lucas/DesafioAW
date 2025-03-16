-- This test ensures that the gross sales for 2011 match the audited accounting value:
-- $12,646,112.16

WITH sales_in_2011 AS (
    SELECT 
        SUM(gross_value) AS total_gross_sales  -- Using the pre-defined metric
    FROM {{ ref('int_sales') }}  -- Referencing the intermediate sales table
    WHERE order_date BETWEEN '2011-01-01' AND '2011-12-31'
)

SELECT total_gross_sales
FROM sales_in_2011
WHERE total_gross_sales != 12646112.16  -- The test will fail if the value does not match

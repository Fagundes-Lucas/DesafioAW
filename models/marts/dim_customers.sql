WITH final_customers AS (
    SELECT
        pk_customer
        , fk_person
        , fk_store
        , fk_territory
        , person_name
        , store_name
    FROM {{ ref('int_customers') }}
)

SELECT * FROM final_customers

WITH
    address AS (
        SELECT *
        FROM {{ ref('stg_erp__address') }}
    )

    , stateprovince AS (
        SELECT *
        FROM {{ ref('stg_erp__stateprovince') }}
    )

    , countryregion AS (
        SELECT *
        FROM {{ ref('stg_erp__countryregion') }}
    )

    , joined AS (
        SELECT
            address.pk_address
            , stateprovince.fk_territory
            , address.fk_state_province
            , stateprovince.fk_country
            , address.address_city
            , stateprovince.stateprovince_name
            , countryregion.country_name
        FROM address
        LEFT JOIN stateprovince
            ON address.fk_state_province = stateprovince.pk_stateprovince
        LEFT JOIN countryregion
            ON stateprovince.fk_country = countryregion.pk_country
    )

SELECT *
FROM joined
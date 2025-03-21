with
    gross_value_2011 as(
        select
            sum(gross_value) as total_gross_value
        from {{ ref('int_sales') }}
        where year(order_date) = 2011
    )

select
    total_gross_value
from gross_value_2011
where total_gross_value not between 12646112.16 and 12646112.26
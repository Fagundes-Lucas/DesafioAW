with 
    salesorderheadersalesreasons as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreasons') }}
    )
    , salesreasons as (
        select *
        from {{ ref('stg_erp__salesreasons') }}
    )
    , joined as (
        select
            salesorderheadersalesreasons.pk_order
            , salesorderheadersalesreasons.fk_reason
            , coalesce(salesreasons.reason_name, 'Unknown') as reason_name
            , coalesce(salesreasons.reason_type, 'Unknown') as reason_type
        from salesorderheadersalesreasons
        left join salesreasons
            on salesorderheadersalesreasons.fk_reason = salesreasons.pk_reason
    )
    , aggregated as (
        select
            pk_order
            , listagg(trim(reason_name), '; ') within group (order by reason_name) as reason_names
            , listagg(trim(reason_type), '; ') within group (order by reason_type) as reason_types
        from joined
        group by pk_order
    )

select *
from aggregated

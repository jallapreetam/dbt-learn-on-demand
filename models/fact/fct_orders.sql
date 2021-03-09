with fct_orders as (

    select 
        a.order_id,
        a.customer_id,
        sum(b.amount) as amount       

    from {{ ref('stg_orders') }} a
    left join {{ ref('stg_payment') }} b on a.order_id = b.order_id

    where b.status = 'success'

    group by a.order_id, a.customer_id
)

select * from fct_orders
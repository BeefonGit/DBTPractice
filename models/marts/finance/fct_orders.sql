with payments as (
    select * from {{ ref('stg_stripe_payment') }}
),

orders as ( 
    select * from {{ ref('stg_jaffle_shop_orders') }}
),

final as (
    select
    orders.order_id,
    orders.customer_id as customer_id,
    sum(case when payments.status = 'success' then payments.amount end) / 100 as amount
    from orders 
    left join payments on orders.order_id = payments.order_id
    group by 1, 2
    order by orders.order_id
)

select * from final
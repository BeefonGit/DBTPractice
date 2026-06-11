-- {{config(static_analysis = 'off')}} || {{config(static_analysis = 'strict')}}
-- If you configure a model with `static_analysis = 'off'`, then downstream models will also be inelligible for static analysis. 

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{source('jaffle_shop', 'orders')}}
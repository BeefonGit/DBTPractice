select
    order_id,
    sum(amount) as total_amount
from {{ref('stg_stripe_payment')}}
group by 1
having total_amount < 0 -- Remember that in a data test, if the result is positive, the test fails. 
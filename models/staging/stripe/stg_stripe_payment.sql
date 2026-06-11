select 
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as amount, --amount is in cents, convert to dara
    created as created_at
from {{source('stripe', 'payment')}}
select
    id as customer_id,
    first_name,
    last_name

from {{source('jaffle_shop', 'customers')}} 
-- Source function has two parameters: source('source_name', 'table_name')
Select
    order_id
  , sum(amount) as total_amt
From
    {{ ref('stg_payments') }}
Group by
    order_id
Having
    total_amt < 0
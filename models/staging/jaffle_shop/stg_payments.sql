
Select
    id as payment_id
  , orderid as order_id
  , paymentmethod as payment_method
  , status
  , amount/100.00 as amount
  , created as created_at
From
    {{ source('stripe', 'payment') }}
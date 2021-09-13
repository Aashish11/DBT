

With customers as 
(
    Select  
        *
    From    
        {{ ref('stg_customers')}}
)

, orders as
(
  Select
    *
  From
    {{ ref('stg_orders')}}
)

, customer_orders as
(
  Select
    customer_id
  , min(order_date) as first_order_date
  , max(order_date) as most_recent_order_date
  , count(order_id) as number_of_orders
  From
    orders
  Group by
    customer_id
)

, final as 
(
    Select
        A.customer_id
      , A.first_name
      , A.last_name
      , B.first_order_date
      , B.most_recent_order_date
      , coalesce(B.number_of_orders, 0) as number_or_orders
    From
        customers as A
    Left Outer Join
        customer_orders as B
    On
        A.customer_id = B.customer_id
)


Select
    *
From
    final
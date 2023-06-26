with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (
    select * from {{ ref('stg_payments') }}


),

final as (

    select
        customers.customer_id,
        orders.order_id,
        payments.payment_id

    from payments

    left join orders using (orderid)

)

select * from final
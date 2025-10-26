-- Test para validar que las métricas de lifetime de los clientes son consistentes
-- Si un cliente tiene más de 1 pedido, debe tener diferentes fechas de primer y último pedido
-- y debe ser clasificado como 'returning'

select
    customer_id,
    count_lifetime_orders,
    customer_type,
    first_order_date,
    last_order_date
from {{ ref('marts__customers') }}
where
    (count_lifetime_orders > 1 and customer_type = 'new')
    or 
    (count_lifetime_orders > 1 and first_order_date = last_order_date)
    or
    (count_lifetime_orders = 1 and customer_type = 'returning')
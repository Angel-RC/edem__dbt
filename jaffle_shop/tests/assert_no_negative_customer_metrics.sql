-- Test para validar que no hay métricas negativas en los clientes
-- Todas las métricas financieras y de conteo deben ser >= 0

select
    customer_id,
    count_lifetime_orders,
    lifetime_spend_pretax,
    lifetime_tax_paid,
    lifetime_spend
from {{ ref('marts__customers') }}
where
    count_lifetime_orders < 0
    or lifetime_spend_pretax < 0
    or lifetime_tax_paid < 0
    or lifetime_spend < 0
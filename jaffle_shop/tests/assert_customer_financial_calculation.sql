-- Test para validar que el cálculo de lifetime_spend es correcto
-- lifetime_spend debe ser igual a lifetime_spend_pretax + lifetime_tax_paid

select
    customer_id,
    lifetime_spend_pretax,
    lifetime_tax_paid,
    lifetime_spend,
    (lifetime_spend_pretax + lifetime_tax_paid) as calculated_lifetime_spend,
    abs(lifetime_spend - (lifetime_spend_pretax + lifetime_tax_paid)) as difference
from {{ ref('marts__customers') }}
where
    abs(lifetime_spend - (lifetime_spend_pretax + lifetime_tax_paid)) > 0.01  -- tolerancia para decimales
-- Modelo incremental
{{ config(
    materialized='incremental'
    unique_key='order_id',
    incremental_strategy='merge') 
}}

select * from {{ ref('staging__orders') }}

{% if is_incremental() %}
    -- Solo procesar datos nuevos
    where ordered_at > (select max(ordered_at) from {{ this }})
{% endif %}
{% snapshot snapshots__products_snapshot_timestamp %}

{{
    config(
      unique_key='sku',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from {{ source('raw', 'products') }}

{% endsnapshot %}

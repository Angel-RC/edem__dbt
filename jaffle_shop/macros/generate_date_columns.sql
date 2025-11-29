{% macro generate_date_columns(date_field) %}
    {{ date_field }} as date,
    extract(year from {{ date_field }}) as year,
    extract(month from {{ date_field }}) as month,
    extract(day from {{ date_field }}) as day,
    extract(dayofweek from {{ date_field }}) as day_of_week,
    case 
        when extract(dayofweek from {{ date_field }}) in (0, 6) then true 
        else false 
    end as is_weekend
{% endmacro %}
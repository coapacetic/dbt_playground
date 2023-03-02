{% macro scramble_customers() %}
{% set sql %}
    insert into analytics.dbt_kcoapman.raw_customers
        select 110, 'Jeremy', 'Smith', current_time;
{% endset %}

{% do run_query(sql) %}
{% do log("New customer inserted", info=True) %}
{% endmacro %}

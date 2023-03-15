select * from {{ ref('raw_customers') }}
changes(information => append_only)
at(stream => 'analytics.dbt_kcoapman.raw_customers_stream')
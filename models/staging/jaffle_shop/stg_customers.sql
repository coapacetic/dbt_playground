{{ config(
        materialized='incremental',
        post_hook=["alter table {{ this }} set change_tracking = true"]
    ) 
}}

with source as (

    select * from {{ ref('raw_customers') }}
    {% if is_incremental() %}
    changes(information => append_only)
    at(stream => 'analytics.dbt_kcoapman.raw_customers_stream')
    {% endif %}
),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        _timestamp

    from source

)

select * from renamed

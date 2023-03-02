{{ config(
        materialized='table',
        post_hook=["alter table {{ this }} set change_tracking = true","create or replace stream raw_customers_stream on table raw_customers"]
    ) 
}}

with source as (
    select * from {{ source('jaffle_shop', 'customers') }}
),

adjusted as (
    select 
        id, 
        first_name,
        last_name,
        current_time as _timestamp
    from source
)

select * from adjusted
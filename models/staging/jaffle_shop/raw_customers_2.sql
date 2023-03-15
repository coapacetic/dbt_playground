{{
    config(
        materialized='copy_into'
    )
}}

select id, first_name, last_name from @my_customers
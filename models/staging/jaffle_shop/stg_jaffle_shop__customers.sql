with source as (
    select * from  {{ source('dbt_migration_tedo', 'customers') }}
),

transformed as (
    select 
        id as customer_id,
        last_name as surname,
        first_name as givenname,
        first_name || ' ' || last_name as full_name
      from source
)

Select * from transformed
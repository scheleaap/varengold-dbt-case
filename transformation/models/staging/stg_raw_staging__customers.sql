with source as (

    select * from {{ source('raw', 'customers') }}

),

renamed as (

    select distinct
        customer_id,
        firstname,
        lastname,
        Age as 'age'

    from source

)

select * from renamed
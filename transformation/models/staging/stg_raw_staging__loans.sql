with source as (

    select * from {{ source('raw', 'loans') }}

),

renamed as (

    select
        customer_id,
        loan_id,
        loan_amount,
        loant_type,
        interest_rate,
        loan_term,
        coalesce(
            try_strptime(approval_rejection_date, '%d.%m.%Y'),
            strptime(approval_rejection_date, '%m/%d/%Y'),
        ) as approval_rejection_date,
        loan_status

    from source

)

select * from renamed
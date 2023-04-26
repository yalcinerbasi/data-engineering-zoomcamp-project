with source AS (

    select * from `dtc-de-383113`.`de_data_warehouse`.`land_and_property_optimized_raw`

),

renamed as (
    select
        `Account_Customer` AS customer,
        `FR`,
        `DFL`,
        `TP`,
        `DLG`,
        `OS_W_`,
        `OS_NPW_`,
        `OS_P_`,
        `OS_NPP_`,
        `SIMS`,
        `OC1`,
        `OC2`,
        `date_added`

    from source
)
select * from renamed
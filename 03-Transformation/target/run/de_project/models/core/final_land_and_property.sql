

  create or replace view `dtc-de-383113`.`de_data_warehouse`.`final_land_and_property`
  OPTIONS()
  as with source as (

    select * from `dtc-de-383113`.`de_data_warehouse`.`land_and_property_transform`

)
SELECT
*
FROM source;


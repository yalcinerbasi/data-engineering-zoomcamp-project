

  create or replace view `dtc-de-383113`.`de_data_warehouse`.`land_and_property_optimized_raw`
  OPTIONS()
  as with source as (
      select * from `dtc-de-383113`.`de_data_warehouse`.`land_and_property_optimized`
)
select * from source;


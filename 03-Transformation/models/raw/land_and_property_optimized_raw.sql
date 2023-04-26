with source as (
      select * from {{ source('de_data_warehouse', 'land_and_property_optimized') }}
)
select * from source
  
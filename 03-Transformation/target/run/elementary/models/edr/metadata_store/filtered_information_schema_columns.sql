

  create or replace view `dtc-de-383113`.`de_data_warehouse`.`filtered_information_schema_columns`
  OPTIONS()
  as 



with filtered_information_schema_columns as (
        with empty_table as (
            select
            
                
        cast('dummy_string' as string) as full_table_name

,
                
        cast('dummy_string' as string) as database_name

,
                
        cast('dummy_string' as string) as schema_name

,
                
        cast('dummy_string' as string) as table_name

,
                
        cast('dummy_string' as string) as column_name

,
                
        cast('dummy_string' as string) as data_type


            )
        select * from empty_table
        where 1 = 0

)

select *
from filtered_information_schema_columns
where full_table_name is not null;


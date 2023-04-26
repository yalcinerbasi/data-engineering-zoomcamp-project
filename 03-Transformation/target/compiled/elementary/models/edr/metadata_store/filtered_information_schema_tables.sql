



with filtered_information_schema_tables as (
        with empty_table as (
            select
            
                
        cast('dummy_string' as string) as full_table_name

,
                
        cast('dummy_string' as string) as full_schema_name

,
                
        cast('dummy_string' as string) as database_name

,
                
        cast('dummy_string' as string) as schema_name

,
                
        cast('dummy_string' as string) as table_name


            )
        select * from empty_table
        where 1 = 0

)

select *
from filtered_information_schema_tables
where schema_name is not null
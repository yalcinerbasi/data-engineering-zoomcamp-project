


    with empty_table as (
            select
            
                
        cast('dummy_string' as string) as column_state_id

,
                
        cast('dummy_string' as string) as full_column_name

,
                
        cast('dummy_string' as string) as full_table_name

,
                
        cast('dummy_string' as string) as column_name

,
                
        cast('dummy_string' as string) as data_type

,
                
        cast (True as BOOL) as is_new

,
                cast('2091-02-17' as TIMESTAMP) as detected_at


            )
        select * from empty_table
        where 1 = 0

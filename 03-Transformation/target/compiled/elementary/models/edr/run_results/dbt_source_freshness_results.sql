


    with empty_table as (
            select
            
                
        cast('dummy_string' as string) as source_freshness_execution_id

,
                
        cast('dummy_string' as string) as unique_id

,
                
        cast('dummy_string' as string) as max_loaded_at

,
                
        cast('dummy_string' as string) as snapshotted_at

,
                
        cast('dummy_string' as string) as generated_at

,
                
        cast(123456789.99 as FLOAT64) as max_loaded_at_time_ago_in_s

,
                
        cast('dummy_string' as string) as status

,
                
        cast('dummy_string' as string) as error

,
                
        cast('dummy_string' as string) as compile_started_at

,
                
        cast('dummy_string' as string) as compile_completed_at

,
                
        cast('dummy_string' as string) as execute_started_at

,
                
        cast('dummy_string' as string) as execute_completed_at

,
                
        cast('dummy_string' as string) as invocation_id


            )
        select * from empty_table
        where 1 = 0

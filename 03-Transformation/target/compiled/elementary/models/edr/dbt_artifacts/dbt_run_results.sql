

with empty_table as (
            select
            
                
        cast('this_is_just_a_long_dummy_string' as string) as model_execution_id

,
                
        cast('this_is_just_a_long_dummy_string' as string) as unique_id

,
                
        cast('dummy_string' as string) as invocation_id

,
                
        cast('dummy_string' as string) as generated_at

,
                
        cast('this_is_just_a_long_dummy_string' as string) as name

,
                
        cast('this_is_just_a_long_dummy_string' as string) as message

,
                
        cast('dummy_string' as string) as status

,
                
        cast('dummy_string' as string) as resource_type

,
                
        cast(123456789.99 as FLOAT64) as execution_time

,
                
        cast('dummy_string' as string) as execute_started_at

,
                
        cast('dummy_string' as string) as execute_completed_at

,
                
        cast('dummy_string' as string) as compile_started_at

,
                
        cast('dummy_string' as string) as compile_completed_at

,
                
        cast(31474836478 as bigint) as rows_affected

,
                
        cast (True as BOOL) as full_refresh

,
                
        cast('this_is_just_a_long_dummy_string' as string) as compiled_code

,
                
        cast(31474836478 as bigint) as failures

,
                
        cast('dummy_string' as string) as query_id

,
                
        cast('dummy_string' as string) as thread_id


            )
        select * from empty_table
        where 1 = 0
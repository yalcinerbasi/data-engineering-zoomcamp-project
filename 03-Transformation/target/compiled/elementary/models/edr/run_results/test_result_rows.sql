

-- depends_on: `dtc-de-383113`.`de_data_warehouse`.`elementary_test_results`
with empty_table as (
            select
            
                
        cast('this_is_just_a_long_dummy_string' as string) as elementary_test_results_id

,
                
        cast('this_is_just_a_long_dummy_string' as string) as result_row

,
                cast('2091-02-17' as TIMESTAMP) as detected_at


            )
        select * from empty_table
        where 1 = 0
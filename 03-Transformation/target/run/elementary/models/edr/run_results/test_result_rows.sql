-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `dtc-de-383113`.`de_data_warehouse`.`test_result_rows` as DBT_INTERNAL_DEST
        using (
        select
        * from `dtc-de-383113`.`de_data_warehouse`.`test_result_rows__dbt_tmp`
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.elementary_test_results_id = DBT_INTERNAL_DEST.elementary_test_results_id
            )

    
    when matched then update set
        `elementary_test_results_id` = DBT_INTERNAL_SOURCE.`elementary_test_results_id`,`result_row` = DBT_INTERNAL_SOURCE.`result_row`,`detected_at` = DBT_INTERNAL_SOURCE.`detected_at`
    

    when not matched then insert
        (`elementary_test_results_id`, `result_row`, `detected_at`)
    values
        (`elementary_test_results_id`, `result_row`, `detected_at`)


    
-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `dtc-de-383113`.`de_data_warehouse`.`schema_columns_snapshot` as DBT_INTERNAL_DEST
        using (


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

        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.column_state_id = DBT_INTERNAL_DEST.column_state_id
            )

    
    when matched then update set
        `column_state_id` = DBT_INTERNAL_SOURCE.`column_state_id`,`full_column_name` = DBT_INTERNAL_SOURCE.`full_column_name`,`full_table_name` = DBT_INTERNAL_SOURCE.`full_table_name`,`column_name` = DBT_INTERNAL_SOURCE.`column_name`,`data_type` = DBT_INTERNAL_SOURCE.`data_type`,`is_new` = DBT_INTERNAL_SOURCE.`is_new`,`detected_at` = DBT_INTERNAL_SOURCE.`detected_at`
    

    when not matched then insert
        (`column_state_id`, `full_column_name`, `full_table_name`, `column_name`, `data_type`, `is_new`, `detected_at`)
    values
        (`column_state_id`, `full_column_name`, `full_table_name`, `column_name`, `data_type`, `is_new`, `detected_at`)


    
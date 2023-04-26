-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `dtc-de-383113`.`de_data_warehouse`.`data_monitoring_metrics` as DBT_INTERNAL_DEST
        using (
        select
        * from `dtc-de-383113`.`de_data_warehouse`.`data_monitoring_metrics__dbt_tmp`
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.id = DBT_INTERNAL_DEST.id
            )

    
    when matched then update set
        `id` = DBT_INTERNAL_SOURCE.`id`,`full_table_name` = DBT_INTERNAL_SOURCE.`full_table_name`,`column_name` = DBT_INTERNAL_SOURCE.`column_name`,`metric_name` = DBT_INTERNAL_SOURCE.`metric_name`,`metric_value` = DBT_INTERNAL_SOURCE.`metric_value`,`source_value` = DBT_INTERNAL_SOURCE.`source_value`,`bucket_start` = DBT_INTERNAL_SOURCE.`bucket_start`,`bucket_end` = DBT_INTERNAL_SOURCE.`bucket_end`,`bucket_duration_hours` = DBT_INTERNAL_SOURCE.`bucket_duration_hours`,`updated_at` = DBT_INTERNAL_SOURCE.`updated_at`,`dimension` = DBT_INTERNAL_SOURCE.`dimension`,`dimension_value` = DBT_INTERNAL_SOURCE.`dimension_value`,`metric_properties` = DBT_INTERNAL_SOURCE.`metric_properties`
    

    when not matched then insert
        (`id`, `full_table_name`, `column_name`, `metric_name`, `metric_value`, `source_value`, `bucket_start`, `bucket_end`, `bucket_duration_hours`, `updated_at`, `dimension`, `dimension_value`, `metric_properties`)
    values
        (`id`, `full_table_name`, `column_name`, `metric_name`, `metric_value`, `source_value`, `bucket_start`, `bucket_end`, `bucket_duration_hours`, `updated_at`, `dimension`, `dimension_value`, `metric_properties`)


    
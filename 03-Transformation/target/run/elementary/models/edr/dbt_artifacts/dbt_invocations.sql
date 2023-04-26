-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `dtc-de-383113`.`de_data_warehouse`.`dbt_invocations` as DBT_INTERNAL_DEST
        using (
        select
        * from `dtc-de-383113`.`de_data_warehouse`.`dbt_invocations__dbt_tmp`
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.invocation_id = DBT_INTERNAL_DEST.invocation_id
            )

    
    when matched then update set
        `invocation_id` = DBT_INTERNAL_SOURCE.`invocation_id`,`job_id` = DBT_INTERNAL_SOURCE.`job_id`,`job_name` = DBT_INTERNAL_SOURCE.`job_name`,`job_run_id` = DBT_INTERNAL_SOURCE.`job_run_id`,`run_started_at` = DBT_INTERNAL_SOURCE.`run_started_at`,`run_completed_at` = DBT_INTERNAL_SOURCE.`run_completed_at`,`generated_at` = DBT_INTERNAL_SOURCE.`generated_at`,`command` = DBT_INTERNAL_SOURCE.`command`,`dbt_version` = DBT_INTERNAL_SOURCE.`dbt_version`,`elementary_version` = DBT_INTERNAL_SOURCE.`elementary_version`,`full_refresh` = DBT_INTERNAL_SOURCE.`full_refresh`,`invocation_vars` = DBT_INTERNAL_SOURCE.`invocation_vars`,`vars` = DBT_INTERNAL_SOURCE.`vars`,`target_name` = DBT_INTERNAL_SOURCE.`target_name`,`target_database` = DBT_INTERNAL_SOURCE.`target_database`,`target_schema` = DBT_INTERNAL_SOURCE.`target_schema`,`target_profile_name` = DBT_INTERNAL_SOURCE.`target_profile_name`,`threads` = DBT_INTERNAL_SOURCE.`threads`,`selected` = DBT_INTERNAL_SOURCE.`selected`,`yaml_selector` = DBT_INTERNAL_SOURCE.`yaml_selector`,`project_id` = DBT_INTERNAL_SOURCE.`project_id`,`project_name` = DBT_INTERNAL_SOURCE.`project_name`,`env` = DBT_INTERNAL_SOURCE.`env`,`env_id` = DBT_INTERNAL_SOURCE.`env_id`,`cause_category` = DBT_INTERNAL_SOURCE.`cause_category`,`cause` = DBT_INTERNAL_SOURCE.`cause`,`pull_request_id` = DBT_INTERNAL_SOURCE.`pull_request_id`,`git_sha` = DBT_INTERNAL_SOURCE.`git_sha`,`orchestrator` = DBT_INTERNAL_SOURCE.`orchestrator`,`dbt_user` = DBT_INTERNAL_SOURCE.`dbt_user`
    

    when not matched then insert
        (`invocation_id`, `job_id`, `job_name`, `job_run_id`, `run_started_at`, `run_completed_at`, `generated_at`, `command`, `dbt_version`, `elementary_version`, `full_refresh`, `invocation_vars`, `vars`, `target_name`, `target_database`, `target_schema`, `target_profile_name`, `threads`, `selected`, `yaml_selector`, `project_id`, `project_name`, `env`, `env_id`, `cause_category`, `cause`, `pull_request_id`, `git_sha`, `orchestrator`, `dbt_user`)
    values
        (`invocation_id`, `job_id`, `job_name`, `job_run_id`, `run_started_at`, `run_completed_at`, `generated_at`, `command`, `dbt_version`, `elementary_version`, `full_refresh`, `invocation_vars`, `vars`, `target_name`, `target_database`, `target_schema`, `target_profile_name`, `threads`, `selected`, `yaml_selector`, `project_id`, `project_name`, `env`, `env_id`, `cause_category`, `cause`, `pull_request_id`, `git_sha`, `orchestrator`, `dbt_user`)


    
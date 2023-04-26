

  create or replace view `dtc-de-383113`.`de_data_warehouse`.`snapshot_run_results`
  OPTIONS()
  as 

with dbt_run_results as (
    select * from `dtc-de-383113`.`de_data_warehouse`.`dbt_run_results`
),

dbt_snapshots as (
    select * from `dtc-de-383113`.`de_data_warehouse`.`dbt_snapshots`
)

SELECT
    run_results.model_execution_id,
    run_results.unique_id,
    run_results.invocation_id,
    run_results.query_id,
    run_results.name,
    run_results.generated_at,
    run_results.status,
    run_results.full_refresh,
    run_results.message,
    run_results.execution_time,
    run_results.execute_started_at,
    run_results.execute_completed_at,
    run_results.compile_started_at,
    run_results.compile_completed_at,
    run_results.compiled_code,
    run_results.thread_id,
    snapshots.database_name,
    snapshots.schema_name,
    snapshots.materialization,
    snapshots.tags,
    snapshots.package_name,
    snapshots.path,
    snapshots.original_path,
    snapshots.owner,
    snapshots.alias
FROM dbt_run_results run_results
JOIN dbt_snapshots snapshots ON run_results.unique_id = snapshots.unique_id;

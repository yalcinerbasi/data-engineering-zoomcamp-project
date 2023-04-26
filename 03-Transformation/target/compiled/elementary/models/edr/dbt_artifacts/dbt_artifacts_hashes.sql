




select
  'dbt_models' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_models`
 union all 

select
  'dbt_tests' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_tests`
 union all 

select
  'dbt_sources' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_sources`
 union all 

select
  'dbt_snapshots' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_snapshots`
 union all 

select
  'dbt_metrics' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_metrics`
 union all 

select
  'dbt_exposures' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_exposures`
 union all 

select
  'dbt_seeds' as artifacts_model,
   metadata_hash
from `dtc-de-383113`.`de_data_warehouse`.`dbt_seeds`


order by metadata_hash
#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket
from prefect_gcp import GcpCredentials
import io
import os
import requests
import calendar


# In[ ]:


@task(retries=3)
def extract_load_web_data(year:int , month:int,file_name) -> None:
    request_url =f"https://use-land-property-data.service.gov.uk/datasets/td/download/history/{calendar.month_name[month]}%20{year}/{file_name}.csv"
    r = requests.get(request_url)
    url_content=r.content
    csv_file = open(f'{file_name}.csv', 'wb')
    csv_file.write(url_content)
    csv_file.close()


# In[ ]:


@task()
def load_csv_data (file_name: str) -> pd.DataFrame:
    df = pd.read_csv(f"{file_name}.csv", sep=',', header=4, index_col=False)
    return df


# In[ ]:


@task()
def clean_local_data(df: pd.DataFrame) -> pd.DataFrame:
    """ We need to add a date column for each DataFrame """
    new_df = df[df["Account Customer"].str.contains("Total")==False]
    """ We are dropping the "Total" Column from the Dataframe """
    new_df = new_df.drop(["Total"], axis=1)
    new_df.columns = new_df.columns.str.replace("[( )]", "_")
    return new_df


# In[ ]:


@task()
def transform_data(df: pd.DataFrame, year, month) -> None:
    df["date_added"] = f"{year}-{month:02}-01"
    return df


# In[ ]:


@task()
def save_transformed_data(df: pd.DataFrame, file_name) -> None:
    df.to_parquet(f"{file_name}.parquet", compression="gzip", index=False)
    df = pd.read_parquet(f"{file_name}.parquet")
    return df


# In[ ]:


@task()
def write_gcs(file_name: str, path_gcp) -> None:
    """Upload local parquet FIle """
    gcp_cloud_storage_bucket_block = GcsBucket.load("de-gcp-bucket")
    gcp_cloud_storage_bucket_block.upload_from_path(
        from_path = f"{file_name}.parquet",
        to_path=f"{path_gcp}/{file_name}"
    )


# In[ ]:


@task()
def write_bq(df: pd.DataFrame) -> None:
    """Write DataFrame to BigQuery"""
    gcp_credentials_block = GcpCredentials.load("de-gcp-cred")
    df.to_gbq(
        destination_table="de_data_warehouse.land_and_property", # Dataset.TableName
        project_id="dtc-de-383113",
        credentials=gcp_credentials_block.get_credentials_from_service_account(),
        chunksize=500.000,
        if_exists="append",
    )


# In[ ]:


@task()
def delete_local_file(file_name) -> None:
    os.remove(f"{file_name}.parquet")
    os.remove(f"{file_name}.csv")


# In[ ]:


@flow()
def etl_web_to_local_to_gcs_to_bq(year: int, month: int) -> None:
    file_name = f"Number-and-types-of-applications-by-all-account-customers-{year}-{month:02}"
    extract_load_web_data(year, month, file_name)
    raw_df = load_csv_data(file_name)
    cleaned_df = clean_local_data(raw_df)
    transformed_df = transform_data (cleaned_df, year, month)
    final_df = save_transformed_data (transformed_df, file_name)
    write_gcs(file_name, "Land_and_Property")
    write_bq(final_df)
    delete_local_file(file_name)


# In[ ]:


@flow()
def etl_parent_flow(years:list[int] , months:list[int]) -> None:
    for year in years:
        for month in months:
            etl_web_to_local_to_gcs_to_bq(year, month)


# ## Execution

# In[ ]:


if __name__ == '__main__':
    years=[2022]
    months=list(range(1,13))
    etl_parent_flow(years, months) 


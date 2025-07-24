import pandas as pd
from pathlib import Path
from google.cloud import bigquery


def hent_data() -> pd.DataFrame:
    client = bigquery.Client()
    query = Path("query.sql").read_text()
    query_job = client.query(query=query)
    results = query_job.result()
    return results.to_dataframe()

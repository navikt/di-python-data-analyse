import pandas as pd
from google.cloud import bigquery


def get_codeline_count_dataset() -> pd.DataFrame:
    client = bigquery.Client()
    query = """
        SELECT
            *
        FROM
            `pensjon-saksbehandli-prod-1f83.teamkatalogen_historikk.aggregert_team_fartstid`
    """
    query_job = client.query(query)
    results = query_job.result()

    return results.to_dataframe()


def main():
    df = get_codeline_count_dataset()
    print(f"Total rows fetched: {len(df)}")
    print(df.head())


if __name__ == "__main__":
    main()

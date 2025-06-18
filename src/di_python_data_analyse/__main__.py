import pandas as pd
from google.cloud import bigquery


def get_codeline_count_dataset() -> pd.DataFrame:
    client = bigquery.Client()
    query = """
        SELECT
            insert_date, repository_visibility, language, blank_lines, comment_lines, code_lines
        FROM
            `appsec-prod-624d.appsec.cloc`
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

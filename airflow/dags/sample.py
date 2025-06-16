from airflow.sdk import DAG
from airflow.providers.standard.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id="sample_sdk_dag",
    start_date=datetime(2025, 6, 1),
    schedule_interval=None,
    catchup=False,
    description="A simple DAG with 3 no-op tasks using airflow.sdk",
    tags=["example", "sdk"],
) as dag:

    t1 = EmptyOperator(task_id="start")
    t2 = EmptyOperator(task_id="middle")
    t3 = EmptyOperator(task_id="end")

    t1 >> t2 >> t3
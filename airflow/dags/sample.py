from airflow.sdk import DAG
from airflow.providers.standard.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id="sample_dag",
    start_date=datetime(2025, 6, 1),
    schedule="@once", 
    catchup=False,
    description="작동 확인용 샘플 DAG",
    tags=["example"],
) as dag:

    t1 = EmptyOperator(task_id="start")
    t2 = EmptyOperator(task_id="middle")
    t3 = EmptyOperator(task_id="end")

    t1 >> t2 >> t3
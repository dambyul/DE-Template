from airflow.sdk import DAG
from airflow.decorators import task
from airflow.providers.standard.operators.empty import EmptyOperator
from airflow.utils.dates import days_ago

with DAG(
    dag_id="sample_dag",
    start_date=days_ago(1),
    schedule_interval=None,
    catchup=False,
    description="작동 확인용 샘플 DAG",
    tags=["example"],
) as dag:

    t1 = EmptyOperator(task_id="start")
    t2 = EmptyOperator(task_id="middle")
    t3 = EmptyOperator(task_id="end")

    t1 >> t2 >> t3
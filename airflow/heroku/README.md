# Heroku 설치용 Apache Airflow 스크립트

- Dyno 환경에서 실행 시 유저 변경이 불가능하기 때문에 컨테이너로 설치 불가함

## 필요 파라미터
- AIRFLOW_CONN_GIT_DEFAULT
```
{
    "conn_type": "git",
    "host": "https://github.com/dambyul/airflow-dag.git", 
    "password": "github_pat_key" 
}
```
- AIRFLOW_CONN_S3_DEFAULT
```
# 인코딩 필요
aws://key:secret/?region_name=region
```
- AIRFLOW_URL
- REDIS_URL
- RESULT_BACKEND_URL
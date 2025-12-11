# DBT (Data Build Tool)

데이터 변환(Transformation) 파이프라인을 구축하기 위한 DBT 환경입니다.  
Docker 컨테이너를 통해 DBT 명령어를 실행하거나, Kubernetes CronJob으로 주기적인 작업을 수행할 수 있습니다.

## 구성 요소

- **DBT Core**: dbt-postgres, dbt-snowflake, dbt-databricks 등 다양한 어댑터 지원 (이미지 변경 가능)

## 설정

`.env` 파일에서 사용할 DBT 이미지를 선택합니다.

```ini
# 예: Postgres용 DBT 이미지
DBT_IMAGE=ghcr.io/dbt-labs/dbt-postgres:latest
```

## 사용 방법

### 1. Docker Compose (Ad-hoc 실행)
컨테이너 내부에서 DBT 명령어를 실행합니다.

```bash
# dbt run 실행 예시
docker-compose run dbt run

# dbt docs generate 실행 예시
docker-compose run dbt docs generate
```

### 2. Kubernetes (Scheduled Jobs)
주기적인 DBT 실행을 위한 CronJob 또는 Git Sync를 포함한 Job 설정이 `k8s/`에 포함되어 있습니다.

```bash
kubectl apply -f k8s/
```

- `dbt-git-sync-job.yaml`: Git 저장소에서 최신 DBT 프로젝트를 가져와 실행하는 작업 정의
- `dbt-pvc.yaml`: 프로젝트 파일 공유를 위한 볼륨

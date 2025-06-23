# DE-Template
- 데이터 파이프라인 구축을 빠르게 진행하기 위한 프레임워크 및 솔루션 구축 템플릿화 프로젝트
- 폴더별로 필요한 시스템을 docker-compose 혹은 k8s를 사용하여 빠르게 구축할 수 있는 것을 목표로 함
- 모든 이미지는 latest 버전을 사용하였음

## 사전 요구 사항 (택1)
- Docker 및 Docker-compose
- Kubernetes

## 구성요소
### [Airflow](airflow) 
- Apache Airflow
- PostgreSQL
- Redis
- Postgres Exporter
- Statsd Exporter

### [DBT](dbt) 
- DBT

### [MySQL](mysql)
- MySQL
- MySQL Exporter

### [PostgreSQL](postgres)
- PostgreSQL
- Postgres Exporter

### [Prometheus, Grafana](prometheus+grafana)
- Prometheus
- Grafana

## 실행 방법
### Docker Compose
- 필요한 폴더를 다운받아 `.env` 값 수정 후 `docker-compose up -d` 명령어로 실행
### Kubernetes
- 필요한 폴더를 다운받아 내부의 k8s 디렉토리에서 `kubectl apply -f .` 명령어로 실행
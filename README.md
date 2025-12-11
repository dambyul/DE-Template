# DE-Template

데이터 엔지니어링 파이프라인 구축을 위한 템플릿 프로젝트입니다.  
Docker Compose, Kubernetes, Helm, Heroku 등 다양한 환경에서 Airflow, DBT, 데이터베이스, 모니터링 시스템을 빠르게 배포하고 운영할 수 있도록 구성되어 있습니다.

## 사전 요구 사항

사용하고자 하는 환경에 따라 아래 도구들이 필요합니다.

- **Docker & Docker Compose**: 컨테이너 기반 로컬 실행 시 필요
- **Kubernetes (kubectl)**: 쿠버네티스 클러스터 배포 시 필요
- **Helm**: Helm Chart를 이용한 배포 시 필요 (선택 사항)
- **Heroku CLI**: Heroku 배포 시 필요 (Airflow 전용)

## 구성 요소

각 디렉토리별 상세 문서는 링크를 참조하세요.

| 컴포넌트 | 설명 | 지원 환경 | 문서 링크 |
| --- | --- | --- | --- |
| **Airflow** | 워크플로우 관리 및 스케줄링 | Docker, K8s, Helm, Heroku | [바로가기](airflow/README.md) |
| **DBT** | 데이터 변환 | Docker, K8s | [바로가기](dbt/README.md) |
| **MySQL** | 관계형 데이터베이스 | Docker, K8s | [바로가기](mysql/README.md) |
| **PostgreSQL** | 관계형 데이터베이스 | Docker, K8s | [바로가기](postgres/README.md) |
| **Monitoring** | Prometheus, Grafana, Loki (모니터링 & 로깅) | Docker, K8s, Helm | [바로가기](monitoring/README.md) |

## 시작하기

### 1. Docker Compose 실행
각 폴더로 이동하여 환경 변수(`.env`)를 설정한 후 실행합니다.

```bash
cd <component_folder>
# .env 파일 수정
docker-compose up -d
```

### 2. Kubernetes 배포
각 폴더의 `k8s` 디렉토리에 있는 매니페스트를 적용합니다.

```bash
cd <component_folder>
kubectl apply -f k8s/
```

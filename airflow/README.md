# Apache Airflow

Docker Compose, Kubernetes, Helm, 그리고 Heroku를 지원하는 Airflow 배포 환경입니다.

## 구성 요소

- **Airflow Core**: Webserver, Scheduler, Triggerer, Worker, DagProcessor
- **Database**: PostgreSQL
- **Broker**: Redis
- **Monitoring**: Postgres Exporter, Statsd Exporter

## 설정

`.env` 파일에서 주요 설정을 관리합니다.

| 환경변수 | 설명 | 기본값 |
| --- | --- | --- |
| `AIRFLOW_ADMIN_USER` | Admin 계정 아이디 | `admin` |
| `AIRFLOW_ADMIN_PASSWORD` | Admin 계정 비밀번호 | `admin@@123` |
| `FERNET_KEY` | 암호화 키 | (난수 문자열) |
| `AIRFLOW_CONN_GIT_DEFAULT` | Git 연결 정보 (DAG 동기화용) | GitHub Repo URL |

## 배포 방법

### 1. Docker Compose
로컬 개발 및 테스트 환경 구축에 적합합니다.

```bash
# 실행
docker-compose up -d

# 종료
docker-compose down
```

### 2. Kubernetes
K8s 클러스터에 배포하기 위한 매니페스트(`k8s/`)가 준비되어 있습니다.

```bash
# 네임스페이스 생성 (선택 사항)
kubectl create namespace airflow

# 매니페스트 적용
kubectl apply -f k8s/ -n airflow
```

주요 파일:
- `airflow-*-deploy.yaml`: 각 컴포넌트 배포
- `postgres-deploy.yaml`: 메타데이터 DB
- `redis-deploy.yaml`: Celery Executor용 브로커

### 3. Helm Chart
`helm/` 디렉토리에 커스텀 차트가 포함되어 있습니다.

```bash
# 차트 설치
helm install airflow ./helm -n airflow --create-namespace

# 업그레이드
helm upgrade airflow ./helm -n airflow
```

`helm/values.yaml` 파일을 수정하여 설정을 변경할 수 있습니다.

### 4. Heroku
Heroku Dyno 환경 배포를 위한 설정 파일(`heroku/`)이 포함되어 있습니다.
**주의**: Dyno 특성상 컨테이너 실행이 제한적일 수 있어 Dockerfile 대신 Procfile 기반 배포를 사용합니다.

- `Procfile`: Heroku 앱 실행 명령 정의
- `Aptfile`: 시스템 패키지 의존성
- `requirements.txt`: Python 패키지 의존성

배포 시 `AIRFLOW_CONN_GIT_DEFAULT`, `AIRFLOW_URL`, `REDIS_URL` 등의 Config Vars를 Heroku 대시보드나 CLI에서 설정해야 합니다.

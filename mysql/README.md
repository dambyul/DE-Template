# MySQL Database

MySQL 데이터베이스 및 Exporter를 포함한 구성입니다.

## 구성 요소

- **MySQL Server**: 데이터베이스 서버
- **MySQL Exporter**: Prometheus 연동을 위한 메트릭 수집기
- **Init Scripts**: 초기 데이터베이스 및 유저 설정을 위한 스크립트 (`initdb/`)

## 설정

`.env` 파일에서 주요 설정을 관리합니다.

| 환경변수 | 설명 |
| --- | --- |
| `MYSQL_ROOT_PASSWORD` | Root 비밀번호 |
| `MYSQL_DATABASE` | 기본 생성 데이터베이스 명 |
| `MYSQL_TZ` | 타임존 (예: Asia/Seoul) |
| `MYSQL_MAX_CONNECTIONS` | 최대 연결 수 튜닝 |
| `MYSQL_INNODB_BUFFER_POOL_SIZE` | 버퍼 풀 사이즈 튜닝 |

## 배포 방법

### 1. Docker Compose
```bash
docker-compose up -d
```
`initdb/exporter_user.sql`이 자동으로 실행되어 Exporter용 유저를 생성합니다.

### 2. Kubernetes
K8s 환경 배포를 위한 매니페스트(`k8s/`)가 준비되어 있습니다.

```bash
kubectl apply -f k8s/
```
- `mysql-deploy.yaml`: MySQL 배포
- `mysql-exporter-deploy.yaml`: Exporter 배포 (Sidecar 또는 별도 파드로 구성)
- `mysql-cm.yaml`: 설정 ConfigMap

# PostgreSQL Database

PostgreSQL 데이터베이스 및 Exporter를 포함한 구성입니다.

## 구성 요소

- **PostgreSQL Server**: 데이터베이스 서버
- **Postgres Exporter**: Prometheus 연동을 위한 메트릭 수집기

## 설정

`.env` 파일에서 주요 설정 및 튜닝 파라미터를 관리합니다.

| 환경변수 | 설명 |
| --- | --- |
| `POSTGRES_User` | 기본 유저 |
| `POSTGRES_PASSWORD` | 비밀번호 |
| `POSTGRES_DB` | 기본 생성 데이터베이스 명 |
| `POSTGRES_SHARED_BUFFERS` | 메모리 튜닝 |
| `POSTGRES_WAL_LEVEL` | WAL 설정 (Replica 등) |
| `POSTGRES_AUTOVACUUM` | Autovacuum 활성화 여부 |

## 배포 방법

### 1. Docker Compose
```bash
docker-compose up -d
```

### 2. Kubernetes
K8s 환경 배포를 위한 매니페스트(`k8s/`)가 준비되어 있습니다.

```bash
kubectl apply -f k8s/
```
- `postgres-deploy.yaml`: PostgreSQL 배포
- `postgres-exporter-deploy.yaml`: Exporter 배포
- `postgres-pvc.yaml`: 데이터 영속성을 위한 PVC

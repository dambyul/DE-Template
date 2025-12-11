# Monitoring Stack

Prometheus, Grafana, Loki 등을 활용한 통합 모니터링 및 로깅 시스템입니다.

## 구성 요소

- **Prometheus**: 메트릭 수집 및 저장
- **Grafana**: 데이터 시각화 및 대시보드
- **Promtail**: 로그 수집 에이전트
- **Loki**: 로그 집계 시스템

## 설정

`.env` 파일 및 각 설정 파일에서 포트와 인증 정보를 관리합니다.

| 설정 파일 | 주요 항목 |
| --- | --- |
| `.env` | 포트 설정 (`PROMETHEUS_PORT`, `GRAFANA_PORT`), Grafana Admin 계정 |
| `prometheus.yml` | Scrape Config (수집 대상 정의) |

## 배포 방법

### 1. Docker Compose
```bash
docker-compose up -d
```
기본적으로 `http://localhost:3000`에서 Grafana에 접속할 수 있습니다. (초기 계정: `.env` 참조)

### 2. Kubernetes
K8s 환경 배포를 위한 매니페스트(`k8s/`)가 준비되어 있습니다.

```bash
kubectl apply -f k8s/
```
- `prometheus-deploy.yaml`: 프로메테우스 서버
- `grafana-deploy.yaml`: 그라파나 대시보드
- `prometheus-cm.yaml`: 프로메테우스 설정 (ConfigMap)

### 3. Helm Chart
`helm/` 디렉토리를 통해 Helm Chart로 배포할 수 있습니다.

```bash
helm install monitoring ./helm
```
`values.yaml`을 통해 리소스 제한, 서비스 타입, 인그레스 설정 등을 커스터마이징할 수 있습니다.

# DE-Template
데이터 엔지니어링을 위해 자주 사용하는 템플릿
폴더별로 필요한 시스템을 docker-compose를 사용하여 빠르게 구축할 수 있는 것을 목표로 함

`prometheus` 및 `grafana`를 사용한 모니터링을 고려하여 exporter도 함께 구성함

## 사전 요구 사항
- Docker 및 Docker-compose

## 실행 방법
- 필요한 폴더를 다운받아 `.env` 값 수정 후 `docker-compose up -d` 명령어로 실행

FROM apache/airflow:latest

USER root
RUN apt-get update && apt-get install -y git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER airflow
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
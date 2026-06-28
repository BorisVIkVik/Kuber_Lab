#!/bin/bash
set -e
# Шаг 1: загрузка данных в HDFS (если нужен)
kubectl apply -f ./pvc.yaml
kubectl apply -f ./hadoop/kuber
sleep 90
kubectl apply -f loader_job.yaml
kubectl wait --for=condition=complete job/hdfs-upload-food --timeout=600s
# Шаг 2: load.py
# kubectl delete job pyspark-load --ignore-not-found
kubectl delete job hdfs-upload-food --ignore-not-found
kubectl apply -f load_py_job.yaml
kubectl wait --for=condition=complete job/pyspark-load --timeout=600s

kubectl delete job pyspark-load --ignore-not-found
kubectl apply -f ./pyspark_app/kuber
sleep 15
kubectl apply -f ./test_job.yaml
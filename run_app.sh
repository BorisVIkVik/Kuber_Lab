#!/bin/bash
set -e


IMAGES=(
  borisvikvik/hadoop-namenode:latest
  borisvikvik/hadoop-datanode:latest
  borisvikvik/hadoop-nodemanager:latest
  borisvikvik/hadoop-resourcemanager:latest
  borisvikvik/pyspark_app_test:latest
  borisvikvik/scala-datamart:latest
  busybox:latest
)

echo "Pulling images into minikube..."
for img in "${IMAGES[@]}"; do
  echo "Pulling $img into minikube"
  minikube image pull "$img"
done
echo "All images pulled."


# Шаг 1: загрузка данных в HDFS (если нужен)
kubectl apply -f ./pvc.yaml
kubectl apply -f ./hadoop/kuber
kubectl wait --for=condition=available deployment/namenode --timeout=600s
kubectl wait --for=condition=available deployment/nodemanager --timeout=600s
kubectl wait --for=condition=available deployment/resourcemanager --timeout=600s
kubectl wait --for=condition=available deployment/datanode1 --timeout=600s
POD=$(kubectl get pod -l io.kompose.service=namenode -o jsonpath='{.items[0].metadata.name}')
kubectl cp data/food.parquet "$POD:/data/food.parquet" -c namenode
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
# Викторов Борис Лабораторная 8.

Работа посвящена миграции работы из 5-7 лаб в Kubernetes.
## Kubernetes 
Для запуска использовался minikube с docker, как драйвером.
Запуск:

    minikube start --cpus=4 --memory=10420 --vm-driver=docker
## Данные: OpenFoodFacts
https://huggingface.co/datasets/openfoodfacts/product-database

## Модель: KMeans

## Database/FileSystem: HDFS
Был взят как копия ветки docker репозитория https://github.com/apache/hadoop/tree/docker-hadoop-3

## Витрина данных
Написана на Scala. Собиралась в docker образ с помощью:

    sbt Docker/publishLocal  
Работает как Job.

## Сервер PySpark
Сервер на Flask. Ждёт POST запрос от Scala витрины. После с помощью PySpark запускает KMeans.

## Структура
```
.
├── data
├── hadoop
│   ├── kuber
│   └── test.sh
└── pyspark_app
    ├── config
    ├── kuber
    └── src

```
Папки:

    config: Хранится yaml файл с конфигурацией pyspark.
    data: Хранится parquet с данными.
    src: Папка для кода модели.
    hadoop: Папка для кода hdfs с docker.
## Запуск

    
    ./run_app.sh

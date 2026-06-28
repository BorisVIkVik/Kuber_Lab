#!/bin/bash
set -e

kubectl delete deployments --all  
kubectl delete services --all      
kubectl delete jobs --all  
kubectl delete pods --all               
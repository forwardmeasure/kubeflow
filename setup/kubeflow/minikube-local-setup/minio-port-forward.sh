#!/bin/bash

kubectl get svc -n kubeflow |grep minio
kubectl port-forward svc/minio-service -n kubeflow 9000:9000

#!/bin/bash

minikube start --cpus 6 --memory 12288 --disk-size=120g --container-runtime=docker --driver=docker --feature-gates=DevicePlugins=true 
#minikube start --cpus 6 --memory 12288 --disk-size=120g

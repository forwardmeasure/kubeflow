#!/bin/bash

export INGRESS_HOST=$(minikube ip)
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

KF_DASHBOARD_URL="http://${INGRESS_HOST}:${INGRESS_PORT}"
echo "Dashboard can be found at: " ${KF_DASHBOARD_URL}
x-www-browser ${KF_DASHBOARD_URL}

#!/bin/bash

kubectl apply -f - <<EOF
apiVersion: rbac.istio.io/v1alpha1
kind: ClusterRbacConfig
metadata:
  name: default
spec:
  mode: "OFF"
EOF

# tell kfp that user=anonymous@kubeflow.org even for in-cluster clients
# like pachyderm (listenerType=SIDECAR_INBOUND, not GATEWAY)
kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: EnvoyFilter
metadata:
  name: add-user-everywhere
  namespace: istio-system
spec:
  filters:
    - filterConfig:
        inlineCode: |
          function envoy_on_request(request_handle)
              request_handle:headers():replace("kubeflow-userid","anonymous@kubeflow.org")
          end
      filterName: envoy.lua
      filterType: HTTP
      insertPosition:
        index: FIRST
      listenerMatch:
        listenerType: SIDECAR_INBOUND
EOF

# Stop header being added multiple times
kubectl delete envoyfilter -n istio-system add-user-filter

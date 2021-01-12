#!/bin/bash

# Create a new namespace:
kubectl create ns seldon-test

# Label that namespace so you can run inference tasks in it:
kubectl label namespace seldon-test serving.kubeflow.org/inferenceservice=enabled

# Create an example SeldonDeployment with a dummy model:

cat <<EOF | kubectl create -n seldon-test -f -
apiVersion: machinelearning.seldon.io/v1
kind: SeldonDeployment
metadata:
  name: seldon-model
spec:
  name: test-deployment
  predictors:
  - componentSpecs:
    - spec:
        containers:
        - image: seldonio/mock_classifier_rest:1.3
          name: classifier
    graph:
      children: []
      endpoint:
        type: REST
      name: classifier
      type: MODEL
    name: example
    replicas: 1
EOF

# Wait for state to become available:
kubectl get sdep seldon-model -n seldon-test -o jsonpath='{.status.state}\n'

# Port forward to the Istio gateway:
kubectl port-forward $(kubectl get pods -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].metadata.name}') -n istio-system 8004:80

# Send a prediction request:
curl -s -d '{"data": {"ndarray":[[1.0, 2.0, 5.0]]}}'    -X POST http://localhost:8004/seldon/seldon/seldon-model/api/v1.0/predictions    -H "Content-Type: application/json"

# You should see a response similar to this:
# {
#  "meta": {
#    "puid": "i2e1i8nq3lnttadd5i14gtu11j",
#    "tags": {
#    },
#    "routing": {
#    },
#    "requestPath": {
#      "classifier": "seldonio/mock_classifier_rest:1.3"
#    },
#    "metrics": []
#  },
#  "data": {
#    "names": ["proba"],
#    "ndarray": [[0.43782349911420193]]
#  }
#}

# Delete the test
kubectl delete ns seldon-test

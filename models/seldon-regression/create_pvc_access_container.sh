#!/bin/bash

sed "s/PVC_NAME/"$(kubectl get workflow -n forwardmeasure -o jsonpath='{.items[0].metadata.name}')"-my-pvc/g" deploy_pipeline/pvc-access.yaml | kubectl -n kubeflow apply -f -

#!/bin/bash

workflow=$(kubectl get workflow -n forwardmeasure -o jsonpath='{.items[0].metadata.name}')

template=`cat deploy_pipeline/seldon_production_pipeline.yaml | sed "s/{{workflow.name}}/$workflow/g"`
# apply the yml with the substituted value
echo "$template" | kubectl -n forwardmeasure apply -f -

#!/bin/bash

kubectl create clusterrolebinding sa-admin --clusterrole=cluster-admin --serviceaccount=forwardmeasure:default-editor

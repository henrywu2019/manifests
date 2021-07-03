#!/bin/bash

set -x

#kubectl delete namespace knative-eventing &
#kubectl delete namespace cert-manager &
#kubectl delete namespace istio-system &
#kubectl delete namespace auth &
#kubectl delete namespace knative-serving &
#kubectl delete namespace kubeflow &
#kubectl delete namespace kubeflow-user-example-com &
#kubectl delete namespace oracle-ocas-gamma &


for ns in auth knative-eventing cert-manager kubeflow knative-serving kubeflow-user-example-com istio-system oracle-ocas-gamma; do

curl -k -H "Content-Type: application/json" -X PUT --data "{ \"kind\": \"Namespace\", \"apiVersion\": \"v1\", \"metadata\": { \"name\": \"$ns\" }, \"spec\": { \"finalizers\": [] } }" \
 http://127.0.0.1:8001/api/v1/namespaces/$ns/finalize


done

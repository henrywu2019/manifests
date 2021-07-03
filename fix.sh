#!/bin/bash

set -x

#kubectl delete namespace knative-eventing &
#kubectl delete namespace cert-manager &
#kubectl delete namespace istio-system &
#kubectl delete namespace auth &
#kubectl delete namespace knative-serving &
#kubectl delete namespace kubeflow &
#kubectl delete namespace kubeflow-user-example-com &


#for ns in knative-eventing cert-manager kubeflow knative-serving kubeflow-user-example-com istio-system; do
for ns in kubeflow ; do
kubectl get namespace "$ns" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/$ns/finalize -f -


done


#!/bin/bash

set -x

kubectl delete namespace knative-eventing &
kubectl delete namespace cert-manager &
kubectl delete namespace istio-system &
kubectl delete namespace auth &
kubectl delete namespace knative-serving &
kubectl delete namespace kubeflow &
kubectl delete namespace oracle-ocas-vision &


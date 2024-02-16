#!/bin/bash

KUEBCONFIG=~/.kube/config

CLOUD_PROVIDER="aws-ec2"
AKEYLESS_GATEWAY_VALUES_FILE="$PWD/values.yaml"
AKEYLESS_GATEWAY_VALUES_FILE="values.yaml"
AKEYLESS_NAMESPACE="$CLOUD_PROVIDER-akeyless-namespace"
AKEYLESS_GATEWAY_NAME="$CLOUD_PROVIDER-gateway"
#AKEYLESS_GATEWAY_CONFIG_URL="https://$CLOUD_PROVIDER.akeyless-security.com" # Default is port 8000
kubectl config set-context --current --namespace="$AKEYLESS_NAMESPACE"
helm repo add akeyless https://akeylesslabs.github.io/helm-charts
helm repo update

helm upgrade -i --repo akeyless "$AKEYLESS_GATEWAY_NAME" akeyless/akeyless-api-gateway -f "$AKEYLESS_GATEWAY_VALUES_FILE" -n "$AKEYLESS_NAMESPACE"

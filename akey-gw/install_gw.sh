#!/bin/bash

#set -x

# ---------------------------------------------------------------
# ------- Input Variables -----------------------BEGIN-----------
# ---------------------------------------------------------------
CLOUD_PROVIDER="aws-ec2"
EMAIL_ADDRESS="shay.m+akey-gw@akeyless.io"
K8S_NAMESPACE_CERT_ISSUER="lets-encrypt-prod-issuer.yml"
AKEYLESS_GATEWAY_VALUES_FILE="$PWD/values.yaml"
AKEYLESS_GATEWAY_VALUES_FILE="values.yaml"
AKEYLESS_NAMESPACE="$CLOUD_PROVIDER-akeyless-namespace"
AKEYLESS_GATEWAY_NAME="$CLOUD_PROVIDER-gateway"
AKEYLESS_GATEWAY_CONFIG_URL="https://$CLOUD_PROVIDER.akeyless-security.com" # Default is port 8000
# ---------------------------------------------------------------
# ------- Input Variables -----------------------END-------------
# ---------------------------------------------------------------

#Create the namespace
sudo kubectl create namespace "$AKEYLESS_NAMESPACE"
#kubectl create namespace cert-manager

# Set default kubectl context
sudo kubectl config set-context --current --namespace="$AKEYLESS_NAMESPACE"

# Install Ingress controller
#echo INSTALLING NGINX INGRESS CONTROLLER
#helm install quickstart ingress-nginx/ingress-nginx -n "$AKEYLESS_NAMESPACE"
#echo INGRESS CONTROLLER INSTALLED

# Install Cert Manager
#echo INSTALLING CERT MANAGER
#helm install -n cert-manager \
#  --set installCRDs=true \
#  --set global.leaderElection.namespace=cert-manager cert-manager jetstack/cert-manager
#echo CERT MANAGER INSTALLED
#echo WAIT 2 MINUTES BEFORE INSTALLING CERT ISSUER
#sleep 120

# Be sure to change email to your email

#Cat << EOF >| "$K8S_NAMESPACE_CERT_ISSUER"
#ApiVersion: cert-manager.io/v1
#Kind: Issuer
#Metadata:
#  annotations: {}
#  name: letsencrypt-prod
#Spec:
#  acme:
#    email: "$EMAIL_ADDRESS"
#    preferredChain: ""
#    privateKeySecretRef:
#      name: letsencrypt-prod
#    server: https://acme-v02.api.letsencrypt.org/directory
#    solvers:
#      - http01:
#          ingress:
#            class: nginx
#EOF

#kubectl apply -f "$K8S_NAMESPACE_CERT_ISSUER" -n "$AKEYLESS_NAMESPACE"

sudo helm install "$AKEYLESS_GATEWAY_NAME" akeyless/akeyless-api-gateway -f "$AKEYLESS_GATEWAY_VALUES_FILE" -n "$AKEYLESS_NAMESPACE"

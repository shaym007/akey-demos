#!/bin/bash
echo "Expose GW poer 8000"

kubectl port-forward services/akeyless-gw-akeyless-api-gateway 8000:8000


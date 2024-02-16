#!/bin/bash


docker run -d -p 8000:8000 \
              -p 8200:8200 \
              -p 18888:18888 \
              -p 8080:8080 \
              -p 8081:8081 \
              -p 5696:5696 \
              -e ADMIN_ACCESS_ID='shay.m@akeyless.io' \
              -e ADMIN_PASSWORD="" \
              -e CLUSTER_NAME="AWS-cluster" \
              --name akeyless-gw akeyless/base


sleep 2

docker logs -f akeyless-gw

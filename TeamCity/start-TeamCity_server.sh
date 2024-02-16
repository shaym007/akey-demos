#!/bin/bash

echo "starting TeamCity Server"

docker run -d --name teamcity-server-instance \
-v ./data:/data/teamcity_server/datadir \
-v ./logs:/opt/teamcity/logs \
-p 8111:8111 \
jetbrains/teamcity-server

sleep 2

docker logs -f teamcity-server-instance


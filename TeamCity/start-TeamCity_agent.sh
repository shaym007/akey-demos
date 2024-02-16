#!/bin/bash

echo "Start TeamCity agent"
cd ~/work/Tools/TeamCity/

docker run -d -it -e SERVER_URL="http://localhost:8111" --name teamcity-agent -v ./agent:/data/teamcity_agent/conf jetbrains/teamcity-agent

sleep 2

docker logs -f teamcity-agent

#!/bin/bash

docker run -d --net puppet \
	--name puppet-client-2 \
	--hostname puppet-client \
	puppet-client:1.0.1 agent --verbose --no-daemonize --summarize

sleep 2

docker logs -f puppet-client-2

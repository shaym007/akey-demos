#!/bin/bash

docker run -d --net puppet \
	--name puppet-client-c \
	--hostname puppet-client \
	puppet/puppet-agent-ubuntu agent --verbose --no-daemonize --summarize

sleep 2

docker logs -f puppet-client-c

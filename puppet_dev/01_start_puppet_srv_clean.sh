#!/bin/bash


docker run -d --net puppet --name puppet-srv-c --hostname puppet puppet/puppetserver

sleep 2
docker logs -f puppet-c


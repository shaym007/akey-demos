#!/bin/bash

#puppetdb-postgres
echo "starting Puppet DB postgress"
docker run --net puppet --name puppetdb-postgres -e POSTGRES_PASSWORD=puppetdb -e POSTGRES_USER=puppetdb -d postgres
sleep 2

#puppetdb
echo "Starting Puppet DB"
docker run --net puppet -d -P --name puppetdb --link puppetdb-postgres:postgres puppet/puppetdb
sleep 2


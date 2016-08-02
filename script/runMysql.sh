#!/usr/bin/env bash

# Run enigma30 DB
docker stop enigma30-mysql && \
docker rm enigma30-mysql && \
#docker run --name enigma30-mysql -v /home/vagrant/data:/data/db enigma30

docker run --name enigma30-mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=Enigme30 mysql:latest

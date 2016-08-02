#!/usr/bin/env bash

# Build and run enigma30
mvn -DskipTests -Pprod package && \
docker build -t laloutre42/docker-enigma30 . && \
docker stop enigma30 && \
docker rm enigma30 && \
docker run --name enigma30 -p 81:8080 -e SPRING_PROFILES_ACTIVE=prod --link enigma30-mysql:mysql laloutre42/docker-enigma30


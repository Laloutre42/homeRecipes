#!/usr/bin/env bash

# Build and Push foodrecipes-server to Docker repository
docker build -t laloutre42/docker-enigma30 . && \
docker login --username=laloutre42 --password=Maximus42 --email=Laloutre42@gmail.com && \
docker push laloutre42/docker-enigma30

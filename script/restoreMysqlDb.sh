#!/usr/bin/env bash

# Dump db
docker exec -i ecs-enigma30-15-enigma30-mysql-e0c3ac99e9a0ecdae801 mysql -uroot -proot enigme30 < dump/enigme30-dump.sql


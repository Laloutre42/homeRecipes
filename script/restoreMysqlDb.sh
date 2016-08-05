#!/usr/bin/env bash

# Dump db
docker exec -i ecs-enigma30-15-enigma30-mysql-e0c3ac99e9a0ecdae801 mysql -uroot -proot enigme30 < dump/enigme30-dump.sql

#docker exec -i ecs-homerecipes-7-homerecipes-mysql-eefa8ef6ce89b8935c00 mysql -uroot homerecipes < dump/homerecipes-dump.sql


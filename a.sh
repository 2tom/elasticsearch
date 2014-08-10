#!/bin/sh

docker run -d -p 9200:9200 -e "NODE_NAME=es131_01" -e "CLUSTER_NAME=es131" --name es131_01 trial/es131

#!/bin/sh

docker run -d -p 192.168.88.11:9201:9200 -p 192.168.88.11:9301:9300 --name es01 trial/es131 --cluster.name es131 --node.name es01

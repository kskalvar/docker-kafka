#!/bin/bash

cd /kafka_2.11-0.9.0.0

bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties

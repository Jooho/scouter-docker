#!/bin/bash

source ../config

docker build -t docker.io/ljhiyh/scouter-server:v${SCOUTER_VERSION} .
docker tag docker.io/ljhiyh/scouter-server:v${SCOUTER_VERSION}  docker.io/ljhiyh/scouter-server:latest
docker push docker.io/ljhiyh/scouter-server:latest 


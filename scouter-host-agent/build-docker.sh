#!/bin/bash

source ../config

docker build -t docker.io/ljhiyh/scouter-host-agent:v${SCOUTER_VERSION} .
docker tag docker.io/ljhiyh/scouter-host-agent:v${SCOUTER_VERSION}  docker.io/ljhiyh/scouter-host-agent:latest
docker push docker.io/ljhiyh/scouter-host-agent:latest 


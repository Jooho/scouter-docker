#!/bin/bash

source ../config

docker build -t docker.io/ljhiyh/scouter-test-app:v${SCOUTER_VERSION}  .
docker tag docker.io/ljhiyh/scouter-test-app:v${SCOUTER_VERSION}  docker.io/ljhiyh/scouter-test-app:latest
docker push docker.io/ljhiyh/scouter-test-app:v${SCOUTER_VERSION}                        
docker push docker.io/ljhiyh/scouter-test-app                       

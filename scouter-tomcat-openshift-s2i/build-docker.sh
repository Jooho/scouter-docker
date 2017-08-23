#!/bin/bash

source ../config

docker build -t docker.io/ljhiyh/webserver30-tomcat7-openshift .                
docker push docker.io/ljhiyh/webserver30-tomcat7-openshift                       

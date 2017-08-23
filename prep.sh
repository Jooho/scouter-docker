#!/bin/bash

source ./config

mkdir ./temp;cd ./temp

if [[ z$1 != z ]];
then
  wget $1
else
  wget https://github.com/scouter-project/scouter/releases/download/v${SCOUTER_VERSION}/scouter-all-${SCOUTER_VERSION}.tar.gz
fi

gzip -d $(echo $1|awk -F'/' '{print $NF}' )

tar xvf $(ls)

if [[ -e ../scouter-server/server ]]; 
then
  cp -R ../scouter-server/server ../scouter-server/server.old
  rm -rf ../scouter-server/server 
elif [[ -e ../scouter-host-agent/agent.host ]];
then
  cp -R ../scouter-host-agent/agent.host ../scouter-host-agent/agent.host.old
  rm -rf ../scouter-host-agent/agent.host
elif [[ -e ../scouter-tomcat-openshift-s2i/scouter ]];
then
  cp -R ../scouter-tomcat-openshift-s2i/scouter ../scouter-tomcat-openshift-s2i/scouter.old
  rm -rf ../scouter-tomcat-openshift-s2i/scouter
  mkdir ../scouter-tomcat-openshift-s2i/scouter
fi

cp -R ./scouter/server ../scouter-server
cp -R ./scouter/agent.host ../scouter-host-agent
cp -R ./scouter/agent.java ../scouter-tomcat-openshift-s2i/scouter

cd ..;rm -rf ./temp

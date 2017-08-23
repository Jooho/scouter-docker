#!/bin/bash

# Scouter Server IP
net_collector_ip=${NET_COLLECTOR_IP:-$SCOUTER_SERVER_SERVICE_HOST}

if [[ z${net_collector_ip} == z ]];
then
  net_collector_ip=$(cat /etc/hosts|grep scouter-server|awk '{print $1}')
fi
# Update Scouter Ports
# UDP Receive Port(Default : 6100)
net_collector_udp_port=${NET_COLLECTOR_UDP_PORT:-6101}


sed "s/%NET_COLLECTOR_IP%/${net_collector_ip}/g" -i conf/scouter.conf
sed "s/%NET_COLLECTOR_UDP_PORT%/${net_collector_udp_port}/g" -i conf/scouter.conf

java  -classpath ./scouter.host.jar scouter.boot.Boot ./lib


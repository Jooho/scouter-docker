TOMCAT_HOME=${TOMCAT_HOME:-/opt/scouter-test-app/apache-tomcat-7.0.67}
HOSTNAME=${HOSTNAME:-scouter_tomcat_jpetstore}

trace_interservice_enabled=true
obj_name=${OBJ_NAME:-$HOSTNAME}
# Scouter Server IP Address 
net_collector_ip=${NET_COLLECTOR_IP}

if [[ z${net_collector_ip} == z ]];
then
  net_collector_ip=$(cat /etc/hosts|grep scouter-server|awk '{print $1}')
fi

# Update Scouter Ports
# UDP Receive Port(Default : 6100)
net_collector_udp_port=${NET_COLLECTOR_UDP_PORT:-6101}

# TCP Receive Port(Default : 6100)
net_collector_tcp_port=${NET_COLLECTOR_TCP_PORT:-6100}

hook_method_patterns=${HOOK_METHOD_PATTERNS:-org.mybatis.jpetstore.*.*}

sed "s/%OBJ_NAME%/${obj_name}/g" -i ${TOMCAT_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_IP%/${net_collector_ip}/g" -i ${TOMCAT_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_UDP_PORT%/${net_collector_udp_port}/g" -i ${TOMCAT_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_TCP_PORT%/${net_collector_tcp_port}/g" -i ${TOMCAT_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%HOOK_METHOD_PATTERNS%/${hook_method_patterns}/g" -i ${TOMCAT_HOME}/scouter/conf/scouter_tomcat.conf

bin/startup.sh; tail -f logs/catalina.out

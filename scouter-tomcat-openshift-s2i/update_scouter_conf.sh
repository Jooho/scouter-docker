JWS_HOME=${JWS_HOME:-/opt/webserver}
HOSTNAME=${HOSTNAME:-scouter_tomcat}

trace_interservice_enabled=true
obj_name=${OBJ_NAME:-$HOSTNAME}
# Scouter Server IP Address (Default : 127.0.0.1)
net_collector_ip=${NET_COLLECTOR_IP:-127.0.0.1}

# Update Scouter Ports
# UDP Receive Port(Default : 6100)
net_collector_udp_port=${NET_COLLECTOR_UDP_PORT:-6101}

# TCP Receive Port(Default : 6100)
net_collector_tcp_port=${NET_COLLECTOR_TCP_PORT:-6100}

hook_method_patterns=${HOOK_METHOD_PATTERNS:-org.mybatis.jpetstore.*.*}

sed "s/%OBJ_NAME%/${obj_name}/g" -i ${JWS_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_IP%/${net_collector_ip}/g" -i ${JWS_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_UDP_PORT%/${net_collector_udp_port}/g" -i ${JWS_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%NET_COLLECTOR_TCP_PORT%/${net_collector_tcp_port}/g" -i ${JWS_HOME}/scouter/conf/scouter_tomcat.conf
sed "s/%HOOK_METHOD_PATTERNS%/${hook_method_patterns}/g" -i ${JWS_HOME}/scouter/conf/scouter_tomcat.conf



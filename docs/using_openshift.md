# OpenShift Scouter

The image is built based on official redhat `registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift`. Only scouter configuration is injected to tomcat. Apart from that, everything is same.


Deploy Scouter Server
--------------------
- The port can be configuable 

*Default Params*:
- NET_TCP_LISTEN_PORT=6100
- NET_UDP_LISTEN_PORT=6101

**Using Default Configuration**
```
oc new-project scouter
oc process -f ${SCOUTER_HOME}/scouter-server/scouter-server-template.yaml | oc create -f -
```

**Using Custom Configuration**
```
oc process -f ${SCOUTER_HOME}/scouter-server/scouter-server-template.yaml -p NET_TCP_LISTEN_PORT=6101 -p NET_UDP_LISTEN_PORT=6102| oc create -f -
```

Deploy Scouter Host Agent
--------------------------
- The Scouter Server should be deployed first
- The port can be configuable
- The Scouter Server IP can be configuable

*Default Params*:
- NET_COLLECTOR_UDP_PORT=6101
- NET_COLLECTOR_IP=$SCOUTER_SERVER_SERVICE_HOST

**Using Default Configuration**
```
oc process -f ${SCOUTER_HOME}/scouter-host-agent/scouter-host-daemonset.yaml   |oc create -f -
```

**Using Custome Configuration**
```
oc process -f ${SCOUTER_HOME}/scouter-host-agent/scouter-host-daemonset.yaml -p NET_COLLECTOR_IP=172.0.0.1 -p NET_COLLECTOR_UDP_PORT=6102 |oc create -f -
```

Deploy Test Application (tomcat-websocket-chat)
----------------------------------
- The Scouter Server should be deployed first
- The port can be configuable
- The Scouter Server IP can be configuable

*Default Params*:
- NET_COLLECTOR_TCP_PORT=6100
- NET_COLLECTOR_UDP_PORT=6101
- NET_COLLECTOR_IP=$(scouter-server ip)
- HOOK_METHOD_PATTERNS=org.mybatis.jpetstore.*.*


**Using Default Configuration**
```
oc process -f ${SCOUTER_HOME}/scouter-tomcat-openshift-s2i/jws30-tomcat7-scouter-s2i -p NET_COLLECTOR_IP=172.30.210.42 -p "HOOK_METHOD_PATTERNS=util.*" -p APPLICATION_NAME=jpetstore |oc create -f -
```

**Using Custome Configuration**
```
oc process -f ${SCOUTER_HOME}/scouter-tomcat-openshift-s2i/jws30-tomcat7-scouter-s2i -p SOURCE_REPOSITORY_URL=https://github.com/mybatis/jpetstore-6.git  -p SOURCE_REPOSITORY_REF="" -p CONTEXT_DIR=""  -p NET_COLLECTOR_IP=172.30.210.42 -p APPLICATION_NAME=jpetstore |oc create -f -

```

**Test URL**
```
http://jpetstore-scouter.${subdomain}/jpetstore
```

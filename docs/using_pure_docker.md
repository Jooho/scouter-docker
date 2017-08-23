# Using Pure Docker

Deploy Scouter Server
--------------------
- The port can be configuable 
- The name must be scouter-server

*Default Params*:
- NET_TCP_LISTEN_PORT=6100
- NET_UDP_LISTEN_PORT=6101

**Using Default Configuration**
```
docker run -it --name scouter-server -p 6100:6100/tcp -p 6101:6101/udp ljhiyh/scouter-server
```
**Using Custom Configuration**
```
docker run -it --name scouter-server -p 6101:6101/tcp -p 6102:6102/udp -e NET_TCP_LISTEN_PORT=6101 -e NET_UDP_LISTEN_PORT=6102 ljhiyh/scouter-server
```

Deploy Scouter Host Agent
--------------------------
- The Scouter Server should be deployed first
- The port can be configuable
- The Scouter Server IP can be configuable

*Default Params*:
- NET_COLLECTOR_UDP_PORT=6101
- NET_COLLECTOR_IP=$(scouter-server ip)

**Using Default Configuration**
```
docker run -it --link scouter-server ljhiyh/scouter-host-agent
```

**Using Custome Configuration**
```
docker run -it --link scouter-server -e NET_COLLECTOR_IP=172.0.0.1 -e NET_COLLECTOR_UDP_PORT=6102 ljhiyh/scouter-host-agent

```

Deploy Test Application (JpetStore)
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
docker run -it --link scouter-server -p 8080:8080 -e OBJ_NAME=scouter-jpetstore ljhiyh/scouter-test-app
```

**Using Custome Configuration**
```
docker run -it --link scouter-server -e OBJ_NAME=scouter-jpetstore -e HOOK_METHOD_PATTERNS=org -e NET_COLLECTOR_IP=172.0.0.1 -e NET_COLLECTOR_UDP_PORT=6102 -e NET_COLLECTOR_TCP_PORT=6101 ljhiyh/scouter-test-app
```
**Test URL**
```
http://localhost:8080/jpetstore
```


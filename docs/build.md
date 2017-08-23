# Build

Pre-requisites
--------------
**1.Clone project**
```
git clone  https://github.com/Jooho/scouter-docker.git
cd scouter-docker
export SCOUTER_HOME=$PWD
```
**2.Update Scouter Version**
```
vi config
SCOUTER_VERSION=v1.7.3.1
```

**3.Download Scouter Release**
By default, preq.sh do not need direct url but specifying the direct url is acceptable.
```
${SCOUTER_HOME}/preq.sh 

or 

./preq.sh https://github.com/scouter-project/scouter/releases/download/v1.7.3.1/scouter-all-1.7.3.1.tar.gz
```
**4.Docker login**
```
docker login docker.io
```


Scouter Server
---------------
**1. Execute build-docker.sh**
This shell create a new Scouter Server Image with tag "v${SCOUTER_VERSION} and latest"
```
cd ${SCOUTER_HOME}/scouter-server
./build-docker.sh
```
**2.Test**
```
docker run -it --name scouter-server -p 6100:6100/tcp -p 6101:6101/udp ljhiyh/scouter-server

 / ___|  ___ ___  _   _| |_ ___ _ __ 
 \___ \ / __/   \| | | | __/ _ \ '__|
  ___) | (_| (+) | |_| | ||  __/ |   
 |____/ \___\___/ \__,_|\__\___|_|                                      
 Open Source S/W Performance Monitoring  
 Scouter version 1.7.3.1
 
System JRE version : 1.8.0_141

```

Scouter Host Agent
------------------
**1. Execute build-docker.sh**
```
cd ${SCOUTER_HOME}/scouter-host-agent
./build-docker.sh
```

**2.Test**
```
docker run -it --link scouter-server ljhiyh/scouter-host-agent 
  ____                  _            
 / ___|  ___ ___  _   _| |_ ___ _ __ 
 \___ \ / __/   \| | | | __/ _ \ '__|
  ___) | (_| (+) | |_| | ||  __/ |   
 |____/ \___\___/ \__,_|\__\___|_|                                      
 Open Source S/W Performance Monitoring  
 Scouter version 1.7.3.1
 
Configure -Dscouter.config=./conf/scouter.conf
Scouter Host Agent Version 1.7.3.1 2017-08-21 11:58 GMT
System JRE version : 1.8.0_141
```

Scouter Test App
----------------
**1. Execute build-docker.sh**
```
cd ${SCOUTER_HOME}/scouter-test-app
./build-docker.sh
```

**2.Test**
```
docker run -it --link scouter-server -e OBJ_NAME=scouter-jpetstore ljhiyh/scouter-test-app
```


Scouter Tomcat OpenShift S2I
------------------
**1. Execute build-docker.sh**
```
cd ${SCOUTER_HOME}/scouter-tomcat-openshift-s2i
./build-docker.sh
```

**2.Test**
```
docker run -it ljhiyh/webserver30-tomcat7-openshift
```



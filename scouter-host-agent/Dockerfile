FROM openjdk 
MAINTAINER Jooho Lee
ENV HOME=/opt/host-agent
RUN mkdir -p ${HOME} && \
     chown -R 1001:0 ${HOME}/ && \
	     useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default  
ADD scouter/agent.host ${HOME}/scouter/agent.host
RUN chown -R 1001:0 ${HOME} && \
      chmod 777 -R ${HOME}
WORKDIR ${HOME}/scouter/agent.host
USER 1001
ENTRYPOINT  java  -classpath ./scouter.host.jar scouter.boot.Boot ./lib
#CMD  while true; do echo hello world; sleep 1; done

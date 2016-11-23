FROM openjdk
MAINTAINER Jooho Lee
ENV HOME=/opt/scouter-test-app
#RUN yum install net-tools bind-utils iptables-services bridge-utils 
RUN mkdir -p ${HOME} && \
     chown -R 1001:0 ${HOME}/ && \
	     useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default  
ADD scouter/agent.java ${HOME}/scouter/agent.java
ADD apache-tomcat-7.0.67  ${HOME}/apache-tomcat-7.0.67 
ADD conf  ${HOME}/conf
RUN chown -R 1001:0 ${HOME} && \
      chmod 777 -R ${HOME}
WORKDIR ${HOME}/apache-tomcat-7.0.67  
EXPOSE 8080
USER 1001
ENTRYPOINT bin/startup.sh; tail -f logs/catalina.out

#CMD  while true; do echo hello world; sleep 1; done

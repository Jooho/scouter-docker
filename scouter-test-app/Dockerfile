FROM registry.centos.org/centos/centos
MAINTAINER Jooho Lee
ENV HOME=/opt/scouter-test-app \
    TOMCAT_HOME=/opt/scouter-test-app/apache-tomcat-7.0.67

RUN yum install -y java-1.8.0-openjdk  \
    java-1.8.0-openjdk-devel  \
    net-tools \
    unzip \
    wget \
    which \
    yum-utils \
    rsync

RUN mkdir -p ${HOME} && \
    chown -R 1001:0 ${HOME}/ && \
    useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" scouter

ADD apache-tomcat-7.0.67  ${HOME}/apache-tomcat-7.0.67 
ADD scouter/agent.java ${TOMCAT_HOME}/scouter/agent.java
ADD conf  ${TOMCAT_HOME}/scouter/conf
ADD entrypoint.sh  ${TOMCAT_HOME}/entrypoint.sh

RUN chown -R 1001:0 ${HOME} && \
      chmod 777 -R ${HOME}
WORKDIR ${TOMCAT_HOME}
EXPOSE 8080
USER 1001
CMD ./entrypoint.sh 
#CMD entrypoint.sh bin/startup.sh; tail -f logs/catalina.out

#CMD  while true; do echo hello world; sleep 1; done

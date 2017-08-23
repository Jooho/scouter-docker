FROM registry.centos.org/centos/centos
MAINTAINER Jooho Lee
ENV HOME=/opt/host-agent

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

ADD agent.host ${HOME}
ADD entrypoint.sh ${HOME}/entrypoint.sh
ADD scouter.conf ${HOME}/conf/scouter.conf

RUN chown -R 1001:0 ${HOME} && \
    chmod 775 -R ${HOME}

WORKDIR ${HOME}
USER 1001

CMD  ["/opt/host-agent/entrypoint.sh"]
#ENTRYPOINT  java  -classpath ./scouter.host.jar scouter.boot.Boot ./lib
#CMD  while true; do echo hello world; sleep 1; done

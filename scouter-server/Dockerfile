FROM registry.centos.org/centos/centos
MAINTAINER Jooho Lee
ENV HOME=/opt/server

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
COPY server ${HOME}

ADD entrypoint.sh ${HOME}/entrypoint.sh
ADD scouter.conf ${HOME}/conf/scouter.conf
WORKDIR ${HOME}
RUN chown -R 1001:0 ${HOME} && \
    chmod 775 -R ${HOME} 
EXPOSE 6100/TCP
EXPOSE 6101/UDP
USER 1001
CMD [ "/opt/server/entrypoint.sh" ]
#ENTRYPOINT  ${HOME}/scouter/entrypoint.sh
#ENTRYPOINT  java -Xmx512m -classpath ./boot.jar scouter.boot.Boot ./lib
#CMD  while true; do echo hello world; sleep 1; done

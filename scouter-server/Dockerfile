FROM openjdk 
MAINTAINER Jooho Lee
ENV HOME=/opt/server
RUN mkdir -p ${HOME} && \
     chown -R 1001:0 ${HOME}/ && \
	     useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default  
COPY server ${HOME}
RUN chown -R 1001:0 /opt/server && \
      chmod 777 -R /opt/server
WORKDIR /opt/server
EXPOSE 6100/TCP
EXPOSE 6101/UDP
USER 1001
ENTRYPOINT  java -Xmx512m -classpath ./boot.jar scouter.boot.Boot ./lib
#CMD  while true; do echo hello world; sleep 1; done

FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat7-openshift
MAINTAINER Jooho Lee
ENV JWS_HOME=/opt/webserver \ 
    HOME=/home/jboss

ADD scouter/agent.java ${JWS_HOME}/scouter/agent.java
ADD conf  ${JWS_HOME}/scouter/conf
ADD update_scouter_conf.sh ${JWS_HOME}/bin/update_scouter_conf.sh
ADD scouter-option.txt ${JWS_HOME}/scouter-option.txt

WORKDIR ${HOME}
RUN sed -i "/#JAVA_OPTS/r ${JWS_HOME}/scouter-option.txt" ${JWS_HOME}/bin/catalina.sh 

USER root
RUN chown -R 185:0 ${JWS_HOME} && \
    chmod 775 -R ${JWS_HOME}

EXPOSE 8080
USER 185


# Use the run script as default since we are working as an hybrid image which can be
# used directly to. (If we were a plain s2i image we would print the usage info here)
CMD [ "/usr/local/s2i/run" ]


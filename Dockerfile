FROM registry.access.redhat.com/jboss-eap-7/eap71-openshift

#USER jboss
USER 0
#USER 185

ADD khan-agent-5.1.0.jar /tmp
ADD test.war /tmp
RUN cp -f /tmp/khan-agent-5.1.0.jar /opt/eap/khan-apm/khan-agent/khan-agent-5.1.0.jar
RUN mkdir -p /opt/eap/standalone/deployments/test.war
RUN cd /opt/eap/standalone/deployments/test.war && \
    unzip /tmp/test.war && \
    touch /opt/eap/standalone/deployments/test.war.dodeploy



RUN chown -R jboss.root /opt/eap

#USER jboss
USER 185

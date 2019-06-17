FROM registry.access.redhat.com/jboss-eap-7/eap72-openshift

#USER jboss
USER 0
#USER 185

ADD test.war /tmp
RUN mkdir -p /opt/eap/standalone/deployments/test.war
RUN cd /opt/eap/standalone/deployments/test.war && \
    unzip /tmp/test.war && \
    touch /opt/eap/standalone/deployments/test.war.dodeploy



RUN chown -R jboss.root /opt/eap

#USER jboss
USER 185

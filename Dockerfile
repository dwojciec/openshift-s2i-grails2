FROM pdouble16/openshift-s2i-browser-base:0.2.1
MAINTAINER "Patrick Double <pat@patdouble.com>"

LABEL io.k8s.description="Builder for Grails 2.x Applications" \
      io.k8s.display-name="Grails 2.x" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,grails,java" \
      io.openshift.min-memory="1Gi"

USER root

# Some proxies will get in the way here, so increasing to avoid time out errors
RUN echo "timeout=200" >> /etc/yum.conf
RUN yum install -y java-1.8.0-openjdk-devel nc netstat && yum clean all -y

# Install expected versions of Grails 2.x
ENV GRAILS_HOME=/opt/app-root/src JAVA_HOME=/usr/lib/jvm/java
RUN mkdir -p ${GRAILS_HOME}
COPY ./grails-wrapper-fetch ${GRAILS_HOME}/grails-wrapper-fetch
RUN chown -R 1001 ${GRAILS_HOME}
USER 1001
RUN cd ${GRAILS_HOME}/grails-wrapper-fetch/fetch-2.3.11 && ./grailsw --version
RUN cd ${GRAILS_HOME}/grails-wrapper-fetch/fetch-2.4.5 && ./grailsw --version
RUN cd ${GRAILS_HOME}/grails-wrapper-fetch/fetch-2.5.5 && ./grailsw --version

# Install S2I scripts
USER root
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i
RUN chmod a+x /usr/libexec/s2i/*

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]

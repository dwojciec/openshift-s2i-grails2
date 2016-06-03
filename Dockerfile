FROM openshift/base-centos7
MAINTAINER "Patrick Double <pat@patdouble.com>"

LABEL io.k8s.description="Builder for Grails 2.x Applications" \
      io.k8s.display-name="Grails 2.x" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,grails,java"

USER root

# Some proxies will get in the way here, so increasing to avoid time out errors
RUN echo "timeout=200" >> /etc/yum.conf
RUN yum update -y && yum install -y java-1.8.0-openjdk-devel nc netstat && yum clean all -y

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i
RUN chmod a+x /usr/libexec/s2i/*

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]

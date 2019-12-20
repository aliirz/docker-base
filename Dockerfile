FROM registry.redhat.io/rhel7/rhel


ARG RHEL_USERNAME
ARG RHEL_PASSWORD



RUN subscription-manager register --username $RHEL_USERNAME --password $RHEL_PASSWORD --auto-attach
RUN subscription-manager repos --enable=rhel-7-server-rpms --enable rhel-7-server-optional-rpms
MAINTAINER ali.raza 
RUN yum update; yum install -y unzip openjdk-7-jre-headless wget supervisor docker.io openssh-server
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
RUN echo 'root:root' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

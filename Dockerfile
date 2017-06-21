FROM openshift/jenkins-2-centos7:latest

USER root

RUN yum install python-devel python2-pip -y && \
    pip install python-openstackclient -y

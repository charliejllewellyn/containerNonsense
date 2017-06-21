FROM openshift/jenkins-2-centos7:latest

USER root

RUN yum install python-devel python-pip -y && \
    pip install python-openstackclient -y

FROM openshift/jenkins-2-centos7:latest

USER root

RUN yum install python-devel python-pip && \
    pip install python-openstackclient

USER 1001

FROM openshift/jenkins-2-centos7:latest

USER root

RUN sudo yum install python-devel python-pip && \
    sudo pip install python-openstackclient

USER 1001

FROM openshift/jenkins-2-centos7:latest

RUN yum install python-devel python-pip \
    pip install python-openstackclient

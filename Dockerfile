FROM openshift/jenkins-2-centos

RUN yum install python-devel python-pip \
    pip install python-openstackclient

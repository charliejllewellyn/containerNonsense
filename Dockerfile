FROM openshift/jenkins-2-centos7:latest

USER root

RUN yum install python-devel -y && \
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python get-pip.py && \
    pip install python-openstackclient

FROM openshift/jenkins-2-centos7:latest

RUN sudo yum install python-devel python-pip \
    sudo pip install python-openstackclient

#!/bin/bash

#echo enter Jenkins username:
#read jenkins_user
echo enter Jenkins API token:
read jenkins_token

jenkins_user='demo-admin'

openstack_password=$(export | grep OS_PASSWORD | awk -F= '{print $2}' | sed "s/'//g")
openstack_username=$(export | grep OS_USERNAME | awk -F= '{print $2}')

if [[ -z $openstack_username ]]; then
    echo enter openstack username:
    read openstack_username
fi

if [[ -z $openstack_password ]]; then
    echo enter openstack password:
    read openstack_password
fi

oc login ocp.customer1.flowersandsausages.co.uk:8443 --username demo --password r3dh4t1\*
jenkins_url=$(oc get route | grep jenkins | awk '{print $2}')

curl -X POST "https://$jenkins_user:$jenkins_token@$jenkins_url/credentials/store/system/domain/_/createCredentials" -k \
--data-urlencode "json={
  \"\": \"0\",
  \"credentials\": {
    \"scope\": \"GLOBAL\",
    \"id\": \"openstackCreds\",
    \"username\": $openstack_username,
    \"password\": $openstack_password,
    \"description\": \"OpenStack credentials for heat deployment\",
    \"\$class\": \"com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl\"
  }
}"

curl -X POST "https://$jenkins_user:$jenkins_token@$jenkins_url/createItem?name=openshift" --data-binary @jenkins-openshift-job.xml -H "Content-Type:text/xml" -k

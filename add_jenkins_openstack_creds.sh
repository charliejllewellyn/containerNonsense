#!/bin/bash

#echo enter Jenkins username:
#read jenkins_user
#echo enter Jenkins API token:
#read jenkins_token

jenkins_user='demo-admin'
jenkins_token='76f8371a0ef26f0c8f03259461c471bc'

openstack_password=$(export | grep OS_PASSWORD | awk -F= '{print $2}' | sed "s/'//g")
openstack_username=$(export | grep OS_USERNAME | awk -F= '{print $2}')

curl -X POST "https://$jenkins_user:$jenkins_token@jenkins-continuous-integration.apps.customer1.flowersandsausages.co.uk/credentials/store/system/domain/_/createCredentials" -k \
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

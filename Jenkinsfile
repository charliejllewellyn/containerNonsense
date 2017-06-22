pipeline {
    environment {
        OS_AUTH_URL="https://cor00005.cni.ukcloud.com:13000/v2.0"
        OS_REGION_NAME="regionOne"
        OS_TENANT_ID="80744eef54974dae807864524061f3f4"
        OS_TENANT_NAME="UKCloud-cllewelyn-Demo"
    }

    agent any

    stages {
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'openstackCreds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "chmod 755 $WORKSPACE/$JOB/jenkins_heat_deploy_openshift.sh"
                    sh "$WORKSPACE/$JOB/jenkins_heat_deploy_openshift.sh"
                }
            }
        }
        stage('Test'){
            steps {
                echo 'test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'deploy'
            }
        }
    }
}

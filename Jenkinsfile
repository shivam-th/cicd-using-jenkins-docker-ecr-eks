pipeline {
    agent any
     environment {
        registry = "983877353540.dkr.ecr.us-east-1.amazonaws.com/cicd-using-jenkins-docker-ecr-eks-helm"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shivam-th/cicd-using-jenkins-docker-ecr-eks.git']])
            }
        }
        
        stage ('Build') {
          steps {
            sh 'mvn clean install'           
            }
         }
         
         stage('Building image') {
          steps{
            script {
              dockerImage = docker.build registry 
              dockerImage.tag("$BUILD_NUMBER")
            }
          }
        }

        
        stage('Cleanup') {
            steps {
                echo 'Cleaning up workspace..'
                cleanWs()
            }
        }
    }
}

pipeline {
    agent any
    environment {
          registry = '983877353540.dkr.ecr.us-east-1.amazonaws.com/cicd-using-jenkins-docker-ecr-eks-helm'
          IMAGE_TAG = "${BUILD_NUMBER}"
          ECR_URI = "${registry}:${IMAGE_TAG}"
          AWS_ROLE_ARN = 'arn:aws:iam::983877353540:role/jenkins-oidc'
    }
    stages {

        stage('Checkout') {
          steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shivam-th/cicd-using-jenkins-docker-ecr-eks.git']])
          }
       }

        stage('Build') {
          steps {
            sh 'mvn clean install'
          }
        }

    stage('Building image') {
          steps {
            script {
              dockerImage = docker.build registry
              dockerImage.tag("$BUILD_NUMBER")
            }
          }
    }


    stage('Pushing to ECR') {
          steps {
        script {
          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 983877353540.dkr.ecr.us-east-1.amazonaws.com'
          sh 'docker push ${registry}:$BUILD_NUMBER'
        }
          }
    }

    stage("Remove Unused docker image"){

      steps{
        sh "docker rmi ${ECR_URI}"
      }
    }

        stage('Deplooy') {
          steps {
            script {
              sh'''
              kubectl apply -f k8s/aws-auth.yaml
              sed "s|<ECR_IMAGE_URI>|${ECR_URI}|g" k8s/deployment.yaml| kubectl apply -f -
              kubectl apply -f k8s/service.yaml
              '''
            }
          }
        }

        stage('System Cleanup') {
          steps {
        script {
          echo 'Cleaning up Docker and Jenkins workspace...'
        }
          }
        }
    }
}

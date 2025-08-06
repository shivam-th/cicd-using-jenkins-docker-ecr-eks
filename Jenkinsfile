pipeline {
    agent any
    environment {
          registry = '983877353540.dkr.ecr.us-east-1.amazonaws.com/cicd-using-jenkins-docker-ecr-eks-helm'
          IMAGE_TAG = "${BUILD_NUMBER}"
          ECR_URI = "${registry}:${IMAGE_TAG}"
          AWS_ROLE_ARN = 'arn:aws:iam::983877353540:role/jenkins-oidc'
    }
    stages {
        stage('Deploy') {
          steps {
              sh """
                aws sts get-caller-identity
              """
          }
      }
}}

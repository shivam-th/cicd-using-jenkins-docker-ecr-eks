pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        stage('Configure AWS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-eks-creds']]) {
                    sh '''
                        aws sts get-caller-identity
                        aws eks update-kubeconfig --region $AWS_DEFAULT_REGION --name my-cluster
                    '''
                }
            }
        }
        stage('Get Nodes') {
            steps {
                sh 'kubectl get nodes'
            }
        }
    }
}

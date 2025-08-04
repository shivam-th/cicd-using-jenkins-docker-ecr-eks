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

         stage('Pushing to ECR') {
          steps{  
              script {
                      sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 983877353540.dkr.ecr.us-east-1.amazonaws.com'
                      sh 'docker push ${registry}:$BUILD_NUMBER'
              }
              }
           }

        
        stage('System Cleanup') {
          steps {
              script {
                  echo 'Cleaning up Docker and Jenkins workspace...'

                  // Remove unused Docker data
                  //sh 'docker system prune -a -f'

                  // Clean Jenkins workspace
                  //sh 'rm -rf /var/lib/jenkins/workspace/*'

                  // Clear Jenkins cache
                  //sh 'rm -rf /var/lib/jenkins/.cache/*'

                  // Clean system logs older than 3 days
                  //sh 'journalctl --vacuum-time=3d'
                    }
                }
            }
    }
}

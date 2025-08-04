pipeline {
    agent any
      stages {
        stage('Helm Dsepdody') {
          steps {
            script {
              sh "kubectl get nodes"
              //sh "kubectl apply -f aws-auth.yaml -n kube-system"
              //sh "kubectl get nodes"
              //sh "kubectl version"
              //sh "helm upgrade first --install helm/mychart --namespace helm-deployment --set image.tag=$BUILD_NUMBER"
            }
          }
        } 
        
    }
}

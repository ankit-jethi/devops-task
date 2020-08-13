pipeline {
   agent any
   stages {
      stage('Build image') {
         steps {
             script {
                 app = docker.build("ankitjethi/devops-task:${BUILD_NUMBER}")
             }
         }
      }
      stage('Push image') {
         steps {
            script {
                docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-login') {
                    app.push()
                    app.push('latest')
                }
            }
         }
      }
      stage('Deploy app') {
         steps {
            sh 'chmod +x k8s-deploy.sh && ./k8s-deploy.sh'
            input 'Do you want to switch the deployment?'
            sh 'sed -i.bkp "s/VER_NUM/${BUILD_NUMBER}/" service.yml \
            && kubectl apply -f service.yml'
         }
      }
      stage('Delete older deloyment') {
          steps {
            input 'Do you want to delete the older deployment?'
            sh 'kubectl delete deployment -n devops-task-namespace -l app=devops-task,version!="${BUILD_NUMBER}"'
          }
      }      
   }
}

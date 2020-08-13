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
      stage('Push image to Docker Hub') {
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
         }
      }
   }
}

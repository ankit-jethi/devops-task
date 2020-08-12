pipeline {
   agent any
   stages {
      stage('Build docker image') {
         steps {
             script {
                 app = docker.build("ankitjethi/devops-task:${env.BUILD_NUMBER}")
             }
         }
      }
      stage('Push docker image to Docker Hub') {
         steps {
            script {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-login') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push('latest')
                }
            }
         }
      }
   }
}

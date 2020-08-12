pipeline {
   agent any
   stages {
      stage('Build docker image') {
         steps {
            sh 'docker build -t ankitjethi/devops-task:$BUILD_NUMBER . \
            && docker build -t ankitjethi/devops-task:latest .'
         }
      }
      stage('Push docker image to Docker Hub') {
         steps {
            script {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                    docker.build('ankitjethi/devops-task').push('$BUILD_NUMBER')
                    docker.build('ankitjethi/devops-task').push('latest')
                }
            }
         }
      }      
   }
}

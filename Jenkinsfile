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
            sh 'docker push ankitjethi/devops-task:$BUILD_NUMBER \
            && docker push ankitjethi/devops-task:latest'
         }
      }
   }
}

pipeline {
   agent any
   stages {
      stage('Build docker image') {
         steps {
            sh 'docker build -t ankitjethi/devops-task:$BUILD_NUMBER . \
            && docker build -t ankitjethi/devops-task:latest .'
         }
      }
   }
}

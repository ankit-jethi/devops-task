pipeline {
   agent any
   stages {
      stage('Build Docker image') {
         steps {
            sh 'docker build -t ankitjethi/devops-task:$BUILD_NUMBER . \
            && docker build -t ankitjethi/devops-task:latest .'
         }
      }
   }
}

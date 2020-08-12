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
                docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-login') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push('latest')
                }
            }
         }
      }
      stage('Deploy app') {
         steps {
            kubernetesDeploy kubeconfigId: 'k8s-login', configs: '01-namespace.yml'
         }
      }
   }
}

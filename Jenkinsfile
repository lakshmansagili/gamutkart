def tomcatIp = '18.223.20.110'
def jenkinsIp = '18.221.129.11'
pipeline {
environment {
    imageName = "tomcat_base"
    registryCredential = 'docker-cred'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Deploy Image') {
      steps{
        sh 'ssh root@${tomcatIp}'
        sh 'scp -i /var/lib/docker/tomcat_base root@${jenkinsIp}:/root'
        dockerImage = lakshmansagili+/${imageName}
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
  }
}

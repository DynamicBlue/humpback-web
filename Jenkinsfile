pipeline {
  agent any
  stages {
    stage('docker build') {
      steps {
        sh 'docker build -t cdynamic-humpbackweb .'
      }
    }
  }
}

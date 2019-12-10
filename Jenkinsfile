pipeline {
  agent any
  stages {
    stage('node builder') {
      steps {
        sh 'yarn install'
        sh 'yarn build '
      }
    }
    stage('docker remove') {
      steps {
        sh '(docker rm -f chumpback-web&&docker rmi -f cdynamic-humpbackweb)||echo "not exits chumpback-web continue "'
      }
    }
    stage('docker build') {
      steps {
        sh 'docker build -t cdynamic-humpbackweb .'
      }
    }
    stage('docker run') {
      steps {
        sh '''docker run -d --net=host --restart=always \\
 -e HUMPBACK_LISTEN_PORT=8012 \\
 -v /mnt/humpback/humpback-web/dbFiles:/humpback-web/dbFiles \\
 --name chumpback-web \\
 cdynamic-humpbackweb:latest'''
      }
    }
  }
  environment {
    CURRENT_IMAGE_NAME = 'cdynamic-humpbackweb:latest'
    CURRENT_CONTAINER_NAME = 'chumpback-web'
    PUSH_ADDRESS = '220.167.101.61:5000'
  }
}
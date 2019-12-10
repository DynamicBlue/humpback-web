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
        sh '(docker rm -f ${CURRENT_CONTAINER_NAME}&&docker rmi -f ${CURRENT_IMAGE_NAME})||echo "not exits chumpback-web continue "'
      }
    }
    stage('docker build') {
      steps {
        sh 'docker build -t ${CURRENT_IMAGE_NAME} .'
      }
    }
    stage('docker run') {
      steps {
        sh '''docker run -d --net=host --restart=always \\
 -e HUMPBACK_LISTEN_PORT=8012 \\
 -v /mnt/humpback/humpback-web/dbFiles:/humpback-web/dbFiles \\
 --name ${chumpback-web} \\
 ${cdynamic-humpbackweb:latest}'''
      }
    }
     stage('docker push server') {
      steps {
        sh 'echo push server docker'
        sh 'docker tag ${CURRENT_IMAGE_NAME} ${PUSH_ADDRESS}/${CURRENT_IMAGE_NAME}'
        sh 'docker push ${PUSH_ADDRESS}/${CURRENT_IMAGE_NAME}'
        sh '(docker rmi -f ${PUSH_ADDRESS}/${CURRENT_IMAGE_NAME})|| echo "continue execute"'
      }
    }
  }
  environment {
    CURRENT_IMAGE_NAME = 'cdynamic-humpbackweb:latest'
    CURRENT_CONTAINER_NAME = 'chumpback-web'
    PUSH_ADDRESS = '220.167.101.61:5000'
  }
}

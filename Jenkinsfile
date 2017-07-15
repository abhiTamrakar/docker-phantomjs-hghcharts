pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''which docker || apt-get install -y docker
'''
        sh 'docker build -t phantomjs-highcharts:${BUILD_NUMBER} .'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker rmi -f $(docker images| awk \'/phantomjs-highcharts/ {print $3}\')'
      }
    }
    stage('Clean_WorkSpace') {
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
      }
    }
  }
}
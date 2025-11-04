pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/shilpi1410/testjenkins.git', branch: 'main'
      }
    }
    stage('Build & Test') {
      steps {
        sh 'go mod tidy || true'
        sh 'go build -o testapp .'
        sh 'go test ./... || true'
      }
    }
    stage('Docker Build & Run') {
      steps {
        script {
          docker.build('testgojenkins')
        }
        sh 'docker run --rm testgojenkins'
      }
    }
  }
}


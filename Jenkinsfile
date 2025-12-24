pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps {
        git 'https://github.com/achalgothe/my-docker-app.git'
      }
    }

    stage('Test') {
      steps {
        echo "Running tests"
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t achalgothe/myapp:latest .'
      }
    }

    stage('Push Image') {
      steps {
        sh 'docker push achalgothe/myapp:latest'
      }
    }

    stage('Deploy') {
      steps {
        sh '''
          docker stop myapp || true
          docker rm myapp || true
          docker run -d --name myapp -p 5000:5000 achalgothe/myapp:latest
        '''
      }
    }
  }
}

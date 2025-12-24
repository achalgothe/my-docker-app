pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
                echo 'Running tests'
            }
        }

        stage('Build Image') {
             stage('Build') {
            steps {
                sh 'docker build -t my-app .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push achalgothe/myapp:latest'
            }
        }
          stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:80 my-app'
            }
        }
    }
}

pipeline {
    agent any

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t achalgothe/my-app:latest .'
            }
        }

        stage('Push Image') {
            ...
        }

        stage('Deploy') {
            ...
        }
    }
}

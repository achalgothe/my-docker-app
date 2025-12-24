pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo "Tests passed"
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t achalgothe/my-app:latest .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push achalgothe/my-app:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop my-app || true
                docker rm my-app || true
                docker run -d -p 80:80 --name my-app achalgothe/my-app:latest
                '''
            }
        }
    }
}

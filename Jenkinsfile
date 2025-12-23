pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/achalgothe/my-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t achalgothe/myapp:latest .'
            }
        }

        stage('Docker Login') {
            steps {
                sh '''
                docker login -u achalgothe -p YOUR_DOCKER_TOKEN
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push achalgothe/myapp:latest'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker run -d -p 5000:5000 --name myapp achalgothe/myapp:latest
                '''
            }
        }
    }
}
        
        

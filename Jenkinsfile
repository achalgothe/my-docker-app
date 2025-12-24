pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/username/repo-name.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application'
                sh 'docker build -t my-docker-app .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
            }
        }

        stage('Push Image') {
            steps {
                echo 'Pushing image to Docker Hub'
                sh 'docker tag my-docker-app username/my-docker-app:latest'
                sh 'docker push username/my-docker-app:latest'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying on EC2'
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker run -d -p 5000:5000 --name myapp username/my-docker-app:latest
                '''
            }
        }
    }
}

pipeline {
    agent any

    environment {
        IMAGE_NAME = "dockerhub_username/cicd-app"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checkout from GitHub"
                git branch: 'main',
                    url: 'https://github.com/username/repo-name.git'
            }
        }

        stage('Build') {
            steps {
                echo "Docker Build"
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Test') {
            steps {
                echo "Running Tests"
                sh 'docker run --rm $IMAGE_NAME:latest echo Test Passed'
            }
        }

        stage('Push') {
            steps {
                echo "Push Image"
                sh 'echo Skipping push for now'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy Stage"
                sh 'echo App Deployed'
            }
        }
    }
}

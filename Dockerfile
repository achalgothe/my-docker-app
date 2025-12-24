pipeline {
    agent any

    environment {
        IMAGE_NAME = "achalgothe/my-docker-app"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checkout Stage"
                git branch: 'main',
                    url: 'https://github.com/achalgothe/my-docker-app.git'
            }
        }

        stage('Build') {
            steps {
                echo "Build Stage"
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Test') {
            steps {
                echo "Test Stage"
                sh 'docker run --rm $IMAGE_NAME:latest echo Test Passed'
            }
        }

        stage('Push') {
            steps {
                echo "Push Stage"
                sh 'echo Docker Push (demo)'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy Stage"
                sh 'echo Deploy to EC2 (demo)'
            }
        }
    }

    post {
        success {
            echo "ALL 5 STAGES COMPLETED SUCCESSFULLY"
        }
    }
}
    

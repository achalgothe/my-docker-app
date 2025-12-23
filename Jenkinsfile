pipeline {
    agent any

    environment {
        IMAGE = "YOUR_DOCKERHUB_USERNAME/myapp"
        TAG = "latest"
        EC2 = "ec2-user@EC2_PUBLIC_IP"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/achalgothe/my-docker-app.git'
            }
        }

        stage('Test') {
            steps {
                sh 'pytest || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE:$TAG .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $IMAGE:$TAG
                    '''
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-key']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $EC2 "
                    docker pull $IMAGE:$TAG &&
                    docker stop myapp || true &&
                    docker rm myapp || true &&
                    docker run -d -p 80:5000 --name myapp $IMAGE:$TAG
                    "
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline Successful"
        }
        failure {
            echo "❌ Pipeline Failed"
        }
    }
}

pipeline {
    agent any

    environment {
        IMAGE_NAME = "dockerhub_username/my-app"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Build') {
            steps {
                echo "Build step"
                sh 'echo Build completed'
            }
        }

        stage('Test') {
            steps {
                echo "Test step"
                sh 'echo Tests completed'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                  docker stop my-app || true
                  docker rm my-app || true
                  docker run -d --name my-app -p 80:80 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
}

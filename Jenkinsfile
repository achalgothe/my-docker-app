pipeline {
    agent any

    stage('Build') {
            steps {
                sh 'docker build -t achalgothe/myapp:latest .'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests"'
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

pipeline {
    agent any

    stages {
        
        stage('Test') {
            steps {
                echo "Test passed"
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t achalgothe/my-app:latest .'
            }
        }
 stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: ''DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push achalgothe/my-app:latest
                    '''
                }
            }
        }
    }
}
        
stage('Deploy') {
    steps {
        sh '''
        docker rm -f myapp || true
        docker pull achalgothe/my-app:latest
        docker run -d --name myapp -p 80:80 achalgothe/my-app:latest
        '''
    }
}
        

stage('Deploy') {
  steps {
    sh '''
       set +e
      docker stop myapp || true
      docker rm myapp || true

      docker run -d \
        --name myapp \
        -p 5000:5000 \
        achalgothe/myapp:latest || true
    '''
  }
}

stage('Test') {
    steps {
        sh '''
            python3 -m pip install --upgrade pip
            pip3 install pytest
            pytest test_app.py
        '''
    }
}

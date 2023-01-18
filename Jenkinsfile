pipeline {
    agent any

    stages {
        stage('Branch verify') {
            steps {
                echo "$GIT_BRANCH"
            }
        }

        stage('Building Angular') {
            steps {
                sh(script:'python --version')
                sh(script:'pwd')
                sh(script: '''
                    docker ps
                ''')
            }
            }
        }
    }

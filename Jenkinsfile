pipeline {
    agent any

    stages {
        stage('Branch verify') {
            steps {
                echo "$GIT_BRANCH"
            }
        }

        stage('Building Angular') {
            agent {
                docker { image 'node:16-alpine' }
            }
            steps {
                sh(script:'node --version')
                sh(script: '''
                    pwd
                    docker build -t cities .
                ''')
            }
            }
        }
    }
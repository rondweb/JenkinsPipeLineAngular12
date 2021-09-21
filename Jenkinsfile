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
                    npm install
                    npm update
                    npm cache clean --force
                    ng add @angular-eslint/schematics --skip-confirmation
                    ng lint cities
                    ng build --prod
                ''')
            }
            }
        }
    }
pipeline {
    agent any

    stages {
        stage('Branch verify') {
            steps {
                echo "$GIT_BRANCH"
            }
        }

        stage('Build') {
            agent {
                docker { image 'node:16-alpine' }
            }
            stages {
                stage('Test node') {
                    steps {
                        sh(script:'node --version')
                    }
                }
                stage('Creating enviroment for angular and building frontend') {
                    steps {
                        sh(script: '''
                        su
                        npm install
                        ng update
                        ng add @angular-eslint/schematics --skip-confirmation
                        ng lint cities
                        ng build --prod
                    ''')
                    }
                }
            }
        }

    // npm run test --watch=false
    //npm install --save-dev @angular-devkit/build-angular
    // stage('Docker build') {
    //     steps {
    //         sh(script: 'docker images -a')
    //         sh(script: '''
    //             pwd
    //             docker images -a
    //             docker build -t cities .
    //             docker images -a
    //         ''')
    //     }
    // }
    }
}

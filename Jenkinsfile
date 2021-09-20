
pipeline {
    agent any

    stages {
        stage('Branch verify') {
            steps {
                echo "$GIT_BRANCH"
            }
        }     

        stage('Creating enviroment') {
            steps {
                sh(script: """
                    pwd
                    virtualenv env
                    . env/bin/activate
                    python --version
                    pip install nodeenv
                    pip install nodejs
                    nodeenv -p
                    npm install
                    ng update
                    ng add @angular-eslint/schematics --skip-confirmation
                    ng lint cities
                    ng build --prod                    
                """)               
            }
        }   

        // npm run test --watch=false
        //npm install --save-dev @angular-devkit/build-angular
        // stage('Docker build') {
        //     steps {
        //         sh(script: 'docker images -a')
        //         sh(script: """
        //             cd azure-vote
        //             docker images -a 
        //             docker build -t jenkins-pipeline .
        //             docker images -a
        //             cd ..
        //         """)
        //     }
        // }     
    }  
}
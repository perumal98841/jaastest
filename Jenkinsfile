pipeline {
    agent any
    parameters{
        choice(choices:['DEV','PROD'],description: 'Please choose which environment you want to deploy the JaaS?', name: 'JaaS Environment')
    }
    stages {
        stage ('Complie stage') {
            steps {
            input 'Shall I Proceed?'
            }

        }
    }

}
pipeline {
    agent any
    parameters{
        choice(choices:['DEV','PROD'],description: 'Please choose which environment you want to deploy the JaaS?', name: 'Environment')
    }
    stages {
        stage ('Ask User') {
            steps {
                echo "flag: ${params.Environment}"
            }

        }        
        stage ('Complie stage') {
            steps {
                input 'Shall I Proceed?'
            }

        }
    }

}
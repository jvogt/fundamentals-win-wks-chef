pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                dir("${env.WORKSPACE}"){
                  powershell '. ./shipit.ps1'
                }
            }
        }
    }
}
pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                dir("${env.WORKSPACE}"){
                  powershell 'ls'
                  powershell '. shipit.ps1'
                }
            }
        }
    }
}
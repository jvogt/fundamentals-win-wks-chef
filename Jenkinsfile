pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                dir("${env.WORKSPACE}/aQA"){
                  powershell 'ls'
                  powershell '. shipit.ps1'
                }
            }
        }
    }
}
pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/nattykunle-glitch/TRYAGAIN_TECH1.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'docker build -t frontend ./frontend'
                sh 'docker build -t backend ./backend'
            }
        }
    }
}

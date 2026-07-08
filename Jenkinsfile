pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('portfolio') {
                    sh 'docker build -t portfolio-app .'
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                sh 'docker rm -f portfolio-app-container || true'
            }
        }

        stage('Run Application') {
            steps {
                sh 'docker run -d -p 3000:80 --name portfolio-app-container portfolio-app'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Portfolio deployment completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}

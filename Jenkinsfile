pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "greatmike1/portfolio-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('portfolio') {
                    sh 'docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$BUILD_NUMBER'
            }
        }

        stage('Stop Existing Container') {
            steps {
                sh 'docker rm -f portfolio-app-container || true'
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker run -d \
                -p 3000:80 \
                --name portfolio-app-container \
                $DOCKER_IMAGE:$BUILD_NUMBER
                '''
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

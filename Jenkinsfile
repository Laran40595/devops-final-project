pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "greatmike1/portfolio-app"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                dir('portfolio') {
                    sh '''
                    docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .
                    docker tag $DOCKER_IMAGE:$BUILD_NUMBER $DOCKER_IMAGE:latest
                    '''
                }
            }
        }


        stage('Login Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }


        stage('Push Docker Image') {
            steps {
                sh '''
                docker push $DOCKER_IMAGE:$BUILD_NUMBER
                docker push $DOCKER_IMAGE:latest
                '''
            }
        }


        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f portfolio-app-container || true

                docker run -d \
                -p 3000:80 \
                --name portfolio-app-container \
                $DOCKER_IMAGE:latest
                '''
            }
        }


        stage('Verify Deployment') {
            steps {
                sh '''
                docker ps
                '''
            }
        }

    }


    post {

        success {
            echo 'Portfolio deployment and Docker Hub push successful!'
        }

        failure {
            echo 'Pipeline failed'
        }

    }

}

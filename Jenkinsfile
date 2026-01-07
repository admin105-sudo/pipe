pipeline {
    agent any

    environment {
        IMAGE_NAME = "ahgbkjjgsfuyhjgnb/pipe-html"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/admin105-sudo/pipe.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('DockerHub Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop html-app || true
                docker rm html-app || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name html-app -p 5000:80 $IMAGE_NAME:latest'
            }
        }
    }

    post {
        success {
            echo '✅ Build & DockerHub push successful'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}


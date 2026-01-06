pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t apps:v1 .'
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
                sh 'docker run -d --name html-app -p 5000:80 apps:v1'
            }
        }
    }

    post {
        success {
            echo '✅ Jenkins Pipeline executed successfully'
        }
        failure {
            echo '❌ Jenkins Pipeline failed'
        }
    }
}

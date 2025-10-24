pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "ticket-app:1.0"
        KUBECONFIG = "C:\\Users\\prava\\.kube\\config"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/pravv25/ticket-booking.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    bat "kubectl apply -f k8s\\deployment.yaml"
                    bat "kubectl apply -f k8s\\service.yaml"
                }
            }
        }
    }
    post {
        success {
            echo "✅ Pipeline finished successfully! All stages completed."
        }
        failure {
            echo "❌ Pipeline failed. Check logs for errors."
        }
    }
}

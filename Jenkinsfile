pipeline {
    agent any

    tools {
        maven 'maven3'
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-pat',
                    url: 'https://github.com/vimalwyne/test.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t vimalwyne/myapp:latest .'
            }
        }
    }

    post {
        success {
            echo "✅ Build & push successful!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}


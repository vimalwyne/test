pipeline {
    agent any
   tools {
    maven 'maven3'   // exact name from Jenkins Global Tool Configuration
    jdk 'jdk17'      // exact name from Jenkins Global Tool Configuration
}


    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        DOCKERHUB_REPO = 'your-dockerhub-username/myapp'
    }

    stages {
    stage('Checkout') {
        steps {
            git branch: 'main',
                credentialsId: 'github-pat',  // Add this line
                url: 'https://github.com/vimalwyne/test.git'  // Use your actual repo URL
        }
    }
}

            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_REPO:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh """
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker push $DOCKERHUB_REPO:latest
                """
            }
        }
    }

    post {
        success {
            echo "✅ Build & Push successful!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}


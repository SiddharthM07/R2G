pipeline {
    agent any

    environment {
        S3_BUCKET = "test-devops1211"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'R2G', url: 'https://github.com/SiddharthM07/R2G.git'
            }
        }

        stage('Package Artifact') {
            steps {
                sh 'python3 test.py' // Generates artifact.py
            }
        }

        stage('Upload to S3') {
            steps {
                sh 'aws s3 cp artifact.py s3://$S3_BUCKET/'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

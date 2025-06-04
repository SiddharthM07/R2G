pipeline{
    agent any

    environment {

        S3_bucket = "test-devops1211"
        Ec2_user = "ubuntu"
        EC2_host = "13.234.21.105"
        Pem_File = "~/.ssh/my-aws-key.pub"

    }

    stages{

        stage ('Clone Repo'){
            steps {
                git branch: 'R2G' , url: 'https://github.com/SiddharthM07/R2G.git'

            }
        }
        stage('Package Artifact') {
            steps {
                sh 'python3 generate_artifact.py' // This should generate artifact.py
            }
        }

        stage('Upload to S3'){
            steps{
                sh 'aws s3 cp artifact.py s3://$S3_bucket/ --profile SiddharthM'
            }
        }
        stage('Download on EC2 & Deploy'){
            steps{
                sh '''
                chmod 400 $Pem_File
                scp -o StrictHostKeyChecking=no -i  $Pem_File artifact.py $Ec2_user@EC2_host: /home/ubuntu/
                '''
            }
        }

    }

    post{
        success{
            echo 'Success'
        }

        failure{
            echo 'Failed'
        }
    }

}



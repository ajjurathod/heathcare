pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ajjurathod/heathcare.git'
            }
        }
        stage('Package and Upload') {
            steps {
                script {
                    // Zip the repository contents
                    sh '''
                    zip -r healthcare.zip .
                    '''
                    // Upload the ZIP file to S3
                    withAWS(credentials: 'aws-credentials-id', region: 'ap-southeast-1') {
                        sh '''
                        aws s3 cp healthcare.zip s3://my-healthcare-app-bucket/
                        '''
                    }
                }
            }
        }
        stage('Deploy with CodeDeploy') {
            steps {
                script {
                    withAWS(credentials: 'aws-credentials-id', region: 'ap-southeast-1') {
                        sh '''
                        aws deploy create-deployment \
                        --application-name HealthcareApp \
                        --deployment-group-name HealthcareAppDeploymentGroup \
                        --s3-location bucket=my-healthcare-app-bucket,bundleType=zip,key=healthcare.zip
                        '''
                    }
                }
            }
        }
    }
}

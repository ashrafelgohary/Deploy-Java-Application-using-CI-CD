pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "ashrafelgohary00/myapp"
    }
    stages {
        stage('Initialize') {
            steps {
                script {
                    env.DOCKER_TAG = env.BUILD_ID  // Ensure the build ID is captured correctly
                }
            }
        }
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/ashrafelgohary/Deploy-Java-Application-using-CI-CD.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'webapp/target/*.war', fingerprint: true
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKER_HUB_REPO:$DOCKER_TAG .
                docker tag $DOCKER_HUB_REPO:$DOCKER_TAG $DOCKER_HUB_REPO:latest
                '''
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                        echo -n $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker push $DOCKER_HUB_REPO:$DOCKER_TAG
                        docker push $DOCKER_HUB_REPO:latest
                        '''
                    }
                }
            }
        }
        stage('Deploy to EKS') {
            steps {
                script {
                    // Use Ansible to deploy to EKS
                    sh "ansible-playbook Ansible/deploy.yml --extra-vars 'image_tag=${env.DOCKER_TAG} docker_hub_repo=${env.DOCKER_HUB_REPO}'"
                }
            }
        }
    }
}

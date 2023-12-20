pipeline {
      agent {
            kubernetes {
                label 'dind-agent'
                yamlFile 'agent.yaml'
            }
        }
            environment {
                GITHUB_REPO_URL = 'https://github.com/persiidan/final_project.git'  // Replace with your GitHub repository URL
                IMAGE_NAME = 'idanpersi/sela_final_project:latest'  // Specify your Docker Hub image name and tag
            }
 
    stages {
          stage('Checkout Code') {
            steps {
                   checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'persi_git_hub_creds', url: "${GITHUB_REPO_URL}"]]])
            }
          }
        stage('Build Docker Image') {
            steps {
                  container('dind') {
                                  script {
                                          echo "started building image...."
                                          sh 'dockerd &'
                                          sh 'sleep 8'
                                          sh "docker build -t ${IMAGE_NAME} ."
                                        echo "finished"
                                  }
                        }
                    }
                }
           stage('Run Tests') {
            steps {
                container('dind') {
                    script {
                        echo "Running tests..."
                        sh 'docker run ${IMAGE_NAME} python-app/test_app.py'
                        echo "Tests completed successfully!"
                    }
                }
            }
        }
          stage('Push Docker Image') {
            steps {
                container('dind') {
                        withCredentials([usernamePassword(credentialsId: 'persi_docker_hub_creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${IMAGE_NAME}"
                                          }
            }
        }
      }
    }

        // Additional stages or steps can be added as needed
    }

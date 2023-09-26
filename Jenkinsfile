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
        stage('Build Docker Image') {
            steps {
                  container('dind') {
                                  script {
                                      checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github_creds', url: "${GITHUB_REPO_URL}"]]])
                                          sh "docker build -t ${IMAGE_NAME} ."
                                          withCredentials([usernamePassword(credentialsId: 'persi_dockerhub_creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                                          sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                                              // Push the Docker image to Docker Hub
                                          sh "docker push ${IMAGE_NAME}"
                                          }
                                  }
                    }
                }
            }
        }

        // Additional stages or steps can be added as needed
    }

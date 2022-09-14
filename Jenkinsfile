pipeline{
    environment { 
        registry = "19251829/node-app" 
        registryCredential = 'dockerhubcredentials' 
        dockerImage = '' 
    }
    agent any
    tools{
        nodejs "nodejs"
    }
    stages{
        stage('Build'){
            steps{
                git 'https://github.com/Priyadharsini01/sample-node-application.git'
            }
        }

        stage('Building image'){
            steps{
                 script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }

         stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }

        stage('Run image'){
            steps{
                sh 'docker run -p 8081:8000 --name $BUILD_NUMBER -d '+registry+':$BUILD_NUMBER'
            }
        } 
    }
    
}
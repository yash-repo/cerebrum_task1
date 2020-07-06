pipline {
	agent any
	
	stages{
		stage('Build Docker Image'){
			steps{
				sh "docker build -t jenkins:latest . "
				
			}
		}	
		stage('Push Docker Image'){
			steps{
				withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerhubpwd')]) {

				sh "docker login -u 21031998 -p ${dockerhubpwd}"
				sh "docker push jenkins:latest"
				}	
			}
		}
		stage('Maven Build'){
			steps{
				sh "mvn clean package"
				
			}
		}
	
	}
}

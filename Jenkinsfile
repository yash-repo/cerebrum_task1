pipeline {
	agent any
	
	stages{
		stage('Maven Build'){
			steps{
				sh "mvn clean package"
				
			}
		}
		
		
		stage('Build Docker Image'){
			steps{
				sh "sudo docker build -t 21031998/jenkins:latest . "
				
			}
		}	
		stage('Push Docker Image'){
			steps{
				withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerhubpwd')]) {

				sh "sudo docker login -u 21031998 -p ${dockerhubpwd}"
				sh "sudo docker push 21031998/jenkins:latest"
				}	
			}
		}

	
	}
}

pipeline {
	agent any
	
	stages{
		stage('Build Docker Image'){
			steps{
				sh "sudo docker build -t 21031998/jenkins:latest . "
				
			}
		}	
		stage('Push Docker Image'){
			steps{
				withVault(configuration: [timeout: 60, vaultCredentialId: 'vault-token', vaultUrl: 'http://127.0.0.1:8200'], vaultSecrets: 						[[path:'secret/dockerhub', secretValues: [[vaultKey: 'username'], [vaultKey: 'password']]]]) {
    					
					sh 'docker login -u $username -p $password'
					sh "sudo docker push 21031998/jenkins:latest"
				
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

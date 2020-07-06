pipeline {

agent any
    
stages {
    
stage("Dev") {
 	steps {
               sh "echo dev"
 		}
 	}
stage("Testing"){
  	steps{
 		sh "echo testing"
	}
}
stage("Production"){
  	steps{
 		sh "echo prod"
	}
}
}
post {
	success{
		sh "echo success"
	}
}

}

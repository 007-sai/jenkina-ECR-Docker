pipeline { 
    agent any 
    stages { 
         stage('Clone repository') {  
            steps {  
                script{ 
                checkout scm 
                } 
            } 
        } 
        stage('Build') {  
            steps {  
                script{ 
                    app = docker.build("jenkins-ecr:${env.BUILD_ID}") 
                } 
            } 
        } 
        stage('Test'){ 
            steps { 
                sh 'trivy image jenkins-ecr:latest || exit 0' 
            } 
        } 
        stage('Deploy') { 
            steps { 
                script{ 
                        docker.withRegistry('https://632057435782.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:ecrtoken') { 
                    app.push() 
                    } 
                } 
            } 
        } 
    } 
}

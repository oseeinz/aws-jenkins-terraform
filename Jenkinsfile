pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
	              cleanWs()
                checkout scm
            }
        }
        stage('Set Env Path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin/"
                }
                sh 'terraform --version'
                sh 'packer.io version'
            }
        }
        stage('Packer Build') {
            steps {
                dir('packer') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        ansiColor('xterm') {
                            sh 'packer.io validate packer.json'
                           // sh 'packer.io build packer.json'
                        }
                    }
                }
            }
        }
        stage('TF Init') {
            steps {
                dir('terraform') {
                    ansiColor('xterm') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('TF Plan') {
            steps {
                dir('terraform') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        ansiColor('xterm') {
                            sh 'terraform plan -out=tfplan'
                        }
                    }
                }
            }
        }
        stage('TF Apply') {
            steps {
                dir('terraform') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        ansiColor('xterm') {
                        //    sh 'terraform apply tfplan'
                        }
                    }
                }
            }
        }
        stage('TF Destroy') {
            steps {
                dir('terraform') {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        ansiColor('xterm') {
                        //    sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}

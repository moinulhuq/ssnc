#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "ap-southeast-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform_code_for_eks') {
                        sh "sudo terraform init -upgrade"
                        sh "sudo terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('helloworldapp') {
                        sh "aws eks update-kubeconfig --name eks_cluster"
                        sh "kubectl apply -f helloworld-deployment.yaml"
                        sh "kubectl apply -f helloworld-service.yaml"
                    }
                }
            }
        }

    }
}

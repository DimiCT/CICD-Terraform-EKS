# CICD-Terraform-EKS
CICD-Terraform-EKS
# Jenkins-Server creates VPC, 2x Public Subnets, SG's and installs Jenkins onto this ec2 server. 
# EKS creates VPC, Subnets, SG's EKS, Nodes, roles and policies.
# CICD-Terraform-EKS

This repository contains the code for deploying an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. The deployment process involves setting up an EC2 instance to run Jenkins, which then automates the creation and management of the EKS cluster through a CI/CD pipeline.

## Repository Structure

- `EKS/`: Contains the Terraform files needed to create the EKS cluster.
- `jenkins-server/`: Contains the Terraform files needed to set up an EC2 instance that runs Jenkins.

## Deployment Steps

### 1. Prerequisites

Before starting the deployment, ensure you have the following:

- An AWS Account
- AWS Root Account Access Keys

#### Generating Root Account Access Keys

To generate root account access keys for the AWS CLI:

1. Sign in to the AWS Management Console as the root user.
2. Navigate to the IAM (Identity and Access Management) service.
3. In the navigation pane, choose "Users" and then select your root user.
4. Choose the "Security credentials" tab, and then under "Access keys for CLI, SDK, & API access," choose "Create access key."
5. Download the .csv file to store your access key ID and secret access key.

### 2. Deploy EC2 Instance for Jenkins

The first step is to deploy an EC2 instance that will run Jenkins. This instance will have user data that installs Terraform, kubectl, Jenkins, and the AWS CLI.

1. Navigate to the `jenkins-server` directory.
2. Initialize and apply the Terraform configuration:
   ```bash
   terraform init
   terraform apply
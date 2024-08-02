# CICD-Terraform-EKS

## Overview

This project sets up a CI/CD pipeline using Terraform and EKS. It includes the creation of necessary infrastructure components and the installation of Jenkins for CI/CD operations.

## Jenkins Server Setup

- **VPC**: Creates a Virtual Private Cloud.
- **Public Subnets**: Sets up two public subnets.
- **Security Groups (SG)**: Configures security groups.
- **Jenkins Installation**: Installs Jenkins onto an EC2 server.

## EKS Cluster Setup

- **VPC**: Creates a Virtual Private Cloud.
- **Subnets**: Configures subnets.
- **Security Groups (SG)**: Sets up security groups.
- **EKS Cluster**: Creates an EKS cluster.
- **Nodes**: Configures worker nodes.
- **Roles and Policies**: Sets up necessary roles and policies.

## Conclusion

This setup ensures a robust CI/CD pipeline with EKS for container orchestration and Jenkins for continuous integration and deployment.

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
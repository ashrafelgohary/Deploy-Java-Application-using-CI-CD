# CI/CD Pipeline for Java Application Deployment to AWS EKS

This repository contains the code and configuration files for a CI/CD pipeline that builds Docker images, pushes them to Docker Hub, and deploys them to an AWS EKS cluster using Jenkins and Ansible.

## Overview

The pipeline automates the following steps:
1. **Build**: Builds a Docker image from the provided `Dockerfile`.
2. **Test**: Runs unit tests inside the Docker container.
3. **Push**: Pushes the Docker image to Docker Hub.
4. **Deploy**: Deploys the Docker image to an AWS EKS cluster using Kubernetes manifests and Ansible.

## Prerequisites

Before using this pipeline, ensure the following are set up:

### 1. Jenkins Server
- Jenkins installed and configured.
- Required plugins installed:
  - Docker Pipeline
  - Git
  - Ansible
  - Pipeline

### 2. AWS EKS Cluster
- An EKS cluster created and configured.
- `kubectl` configured to access the EKS cluster.

### 3. Docker Hub Account
- A Docker Hub account for pushing Docker images.

### 4. Tools on Jenkins Server
- Docker installed.
- Ansible installed.
- AWS CLI installed and configured.
- `kubectl` installed and configured.

### 5. GitHub Repository
- This repository cloned and configured with the necessary files:
  - `Dockerfile`
  - Kubernetes manifests (`deployment.yml.j2`, `service.yml`)
  - Ansible playbook (`deploy.yml`)
  - Jenkins pipeline script (`Jenkinsfile`)


## How to Use

### 1. Set Up Jenkins Pipeline
1. Create a new pipeline job in Jenkins.
2. Configure the pipeline to use the `Jenkinsfile` from this repository.
3. Add the following credentials to Jenkins:
   - **Docker Hub Credentials**: Store your Docker Hub username and password.
   - **AWS Credentials**: Store your AWS access key and secret key.

### 2. Create and configure EKS Cluster

Run the following `eksctl` command to create an EKS cluster:

```bash
eksctl create cluster \
  --name eks-cluster \
  --region us-east-1 \
  --nodegroup-name my-nodes \
  --node-type t3.medium \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 4 \
  --managed
```
Update kubeconfig to use EKS cluster
```bash
aws eks update-kubeconfig --name eks-cluster --region us-east-1
```

### 3. Configure Kubernetes Manifests
Update the Kubernetes manifests (`deployment.yml.j2` and `service.yml`) in the `kubernetes/` directory to match your application configuration.

### 4. Configure Ansible Playbook
Update the Ansible playbook (`deploy.yml`) in the `ansible/` directory if additional deployment steps are required.

### 5. Trigger the Pipeline
1. Push code to the `main` branch of this repository.
2. The Jenkins pipeline will automatically:
   - Build the Docker image.
   - Push the image to Docker Hub.
   - Deploy the image to the EKS cluster.

## Pipeline Stages

1. **Checkout**: Pulls the code from the Git repository.
2. **Build**: Builds the Docker image.
4. **Push**: Pushes the Docker image to Docker Hub.
5. **Deploy**: Deploys the Docker image to the EKS cluster using Ansible.


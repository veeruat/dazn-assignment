# Terraform AWS Deployment for Containerized Web Service

This project demonstrates deploying a simple containerized web service on AWS using Terraform. The service is a web server running inside a Docker container, served behind an AWS Load Balancer. The deployment includes a Docker registry (ECR), VPC, subnets, security groups, an EC2 instance, and a Load Balancer.
## Solution Architecture Diagram
![dazn-assignment(2)](https://github.com/veeruat/dazn-assignment/assets/3947004/31c8ed21-f46f-40e0-8904-cb84939404ee)


## Prerequisites

- Terraform installed on your local machine
- AWS CLI configured with the necessary access keys
- Docker installed on your local machine
- An AWS account with permissions to create the necessary resources

## Step-by-Step Deployment

### 1. Build Docker Image

Create a Docker image for the web server and push it to AWS ECR.

**Dockerfile**

```dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html

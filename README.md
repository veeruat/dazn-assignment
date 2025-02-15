# Terraform AWS Deployment for Containerized Web Service

This project demonstrates deploying a containerized static web page on AWS using Terraform. Sample HTML page hosted on Nginx web server which is running inside a Docker container, served behind an AWS Load Balancer. The deployment includes a Docker registry (ECR), VPC, subnets, security groups, an EC2 instance, and a Load Balancer.
## Solution Architecture Diagram
![dazn-assignment(2)](https://github.com/veeruat/dazn-assignment/assets/3947004/31c8ed21-f46f-40e0-8904-cb84939404ee)


## Prerequisites

- Terraform installed on your local machine
- AWS CLI configured with the necessary access keys
- Docker installed on your local machine
- An AWS account with permissions to create the necessary resources

## Project Directory Structure

The project directory is organized as follows:

- **app**: Contains the HTML page.
- **terraform**: Includes all Terraform modules and configuration files.
- **Dockerfile**: Defines the configuration to build the Docker image for the web server and for hosting static HTML page.


## Terraform modules inputs

| Name                          | Description                                         |
|-------------------------------|-----------------------------------------------------|
| dazn_region                   | The AWS region to create resources in               |
| dazn_vpc_cidr_block           | The CIDR block for the VPC                          |
| dazn_public_subnets           | List of public subnet CIDR blocks                   |
| dazn_availability_zones       | List of availability zones                          |
| dazn_allowed_ssh_ips          | IP addresses allowed to SSH into the instance       |
| dazn_app_instance_ami_id      | The AMI ID for the EC2 instance                     |
| dazn_app_instance_pvt_key     | APP EC2 instance private key path, this required SSH to instance from the Terraform provisioner                   |
| dazn_public_key_path          | Path to the public key to be used for SSH access    |
| dazn_app_instance_type        | The type of instance to create                      |
| dazn_app_instance_user        | APP EC2 instance user                               |
| dazn_app_instance_role_name   | DAZN APP docker image URL                           |
| dazn_app_instance_name_tag    | EC2 instance name tag                               |
| dazn_ecr_repo_name            | ECR repo name                                       |
| dazn_app_port                 | Application port                                    |

## Step-by-Step Deployment

Follow these steps to deploy the Terraform infrastructure:

### 1. Generate SSH Keys

Generate SSH keys locally using `ssh-keygen`. These keys are necessary for connecting to the application instance.

### 2. Configure AWS CLI

Configure the AWS CLI with the required access credentials to authenticate Terraform with AWS.

### 3. Initialize Terraform

Navigate to the Terraform directory and initialize Terraform with the following command:
```
terraform init
terraform plan
terraform apply
```
## Test Results

### OS Version:
![Screenshot from 2024-07-05 01-12-17](https://github.com/veeruat/dazn-assignment/assets/3947004/ab51038d-5fb5-4101-9124-c69e8c582cbe)

### Terraform Version
![Screenshot from 2024-07-05 01-14-46](https://github.com/veeruat/dazn-assignment/assets/3947004/57340830-c95f-4725-a12f-14c6b978cc85)

### Terraform Apply Status
![Screenshot from 2024-07-05 01-15-48](https://github.com/veeruat/dazn-assignment/assets/3947004/d0253f3c-5cdc-4754-9697-144c4fee52aa)

### Weg Page
![Screenshot from 2024-07-05 01-20-50](https://github.com/veeruat/dazn-assignment/assets/3947004/76f83d96-0775-4fe3-9159-0de744a009c0)






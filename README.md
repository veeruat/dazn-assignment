# Terraform AWS Deployment for Containerized Web Service

This project demonstrates deploying a simple containerized web service on AWS using Terraform. The service is a web server running inside a Docker container, served behind an AWS Load Balancer. The deployment includes a Docker registry (ECR), VPC, subnets, security groups, an EC2 instance, and a Load Balancer.
## Solution Architecture Diagram
![dazn-assignment(2)](https://github.com/veeruat/dazn-assignment/assets/3947004/31c8ed21-f46f-40e0-8904-cb84939404ee)


## Prerequisites

- Terraform installed on your local machine
- AWS CLI configured with the necessary access keys
- Docker installed on your local machine
- An AWS account with permissions to create the necessary resources

## Inputs

| Name                          | Description                                         |
|-------------------------------|-----------------------------------------------------|
| dazn_region                   | The AWS region to create resources in               |
| dazn_vpc_cidr_block           | The CIDR block for the VPC                          |
| dazn_public_subnets           | List of public subnet CIDR blocks                   |
| dazn_availability_zones       | List of availability zones                          |
| dazn_allowed_ssh_ips          | IP addresses allowed to SSH into the instance       |
| dazn_app_instance_ami_id      | The AMI ID for the EC2 instance                     |
| dazn_app_instance_pvt_key     | APP EC2 instance private key path, this required SSH to instance from provisioner                   |
| dazn_public_key_path          | Path to the public key to be used for SSH access    |
| dazn_app_instance_type        | The type of instance to create                      |
| dazn_app_instance_user        | APP EC2 instance user                               |
| dazn_app_instance_role_name   | DAZN APP docker image URL                           |
| dazn_app_instance_name_tag    | EC2 instance name tag                               |
| dazn_ecr_repo_name            | ECR repo name                                       |
| dazn_app_port                 | Application port                                    |

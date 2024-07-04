variable "dazn_region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "dazn_vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "dazn_public_subnets" {
  description = "List of public subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "dazn_private_subnets" {
  description = "List of private subnet CIDR blocks"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "dazn_availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "dazn_allowed_ssh_ips" {
  description = "IP addresses allowed to SSH into the instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "dazn_app_instance_ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-03b039a920e4e8966"
}

variable "dazn_app_instance_pvt_key" {
  description = "APP EC2 instance private key path"
  type        = string
}

variable "dazn_public_key_path" {
  description = "Path to the public key to be used for SSH access"
  type        = string
}


variable "dazn_app_instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "dazn_app_instance_user" {
  description = "APP EC2 instance user"
  type        = string
}

# variable "dazn_app_docker_image_url" {
#   description = "DAZN APP docker image URL"
#   type        = string
# }

variable "dazn_app_instance_role_name" {
  description = "DAZN APP docker image URL"
  type        = string
  default     = "dazn_ec2_instance_role"
}

variable "dazn_app_instance_name_tag" {
  description = "EC2 instance name tag"
  type        = string
  default     = "dazn_app_instance"
}

# variable "dazn_app_instance_provisioner_cmds" {
#   description = "EC2 instance provisioner commands"
#   type        = list(string)
# }

variable "dazn_ecr_repo_name" {
  description = "ECR repo name"
  type        = string
  default     = "dazn_ecr_repo"
}

variable "dazn_app_port" {
  description = "Application port"
  type        = number
}

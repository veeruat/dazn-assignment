# AWS region
provider "aws" {
  region = var.dazn_region
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block = var.dazn_vpc_cidr_block

}

module "docker_registry" {
  source = "./modules/docker-registry"

  ecr_repo_name     = var.dazn_ecr_repo_name
  local_exec_enable = true
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id             = module.vpc.vpc_id
  public_subnets     = var.dazn_public_subnets
  availability_zones = var.dazn_availability_zones
}


module "ssh_key" {
  source = "./modules/ssh-key"

  public_key_path = var.dazn_public_key_path
}

# Security groups for Application instance and Load Balancer.
module "security_groups" {
  source = "./modules/security-groups"

  vpc_id          = module.vpc.vpc_id
  allowed_ssh_ips = var.dazn_allowed_ssh_ips
  http_from_port  = var.dazn_app_port
  http_to_port    = var.dazn_app_port
}

module "app_ec2_instance_role" {
  source = "./modules/iam_roles"

  ec2_instance_role_name = var.dazn_app_instance_role_name
}

module "app_ec2_instance" {
  source = "./modules/ec2"

  ec2_key_name                    = module.ssh_key.key_name
  ec2_instance_type               = var.dazn_app_instance_type
  ec2_subnet_id                   = module.subnets.public_subnet_ids[0]
  ec2_ami_id                      = var.dazn_app_instance_ami_id
  ec2_security_group_ids          = [module.security_groups.ec2_sg_id]
  ec2_instance_name_tag           = var.dazn_app_instance_name_tag
  ec2_instance_role_name          = var.dazn_app_instance_role_name
  docker_image                    = module.docker_registry.repository_url
  private_key_path                = var.dazn_app_instance_pvt_key
  ec2_ssh_user                    = var.dazn_app_instance_user
  enable_provisioner              = true
  ec2_associate_public_ip_address = true
}


module "lb" {
  source = "./modules/lb"

  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.subnets.public_subnet_ids
  instance_id           = module.app_ec2_instance.ec2_instance_id
  aws_security_group_id = [module.security_groups.lb_sg_id]
}

module "internet_gateway" {
  source = "./modules/internet-gateway"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
}


variable "ec2_key_name" {
  description = "SSH key-pair"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami_id" {
  description = "EC2 instance AMI ID"
  type        = string
}

variable "ec2_security_group_ids" {
  description = "SG IDs"
  type        = list(string)
}

variable "ec2_subnet_id" {
  description = "subnet ID"
  type        = string
}

variable "ec2_instance_role_name" {
  description = "EC2 instance role name"
  type        = string
}

variable "ec2_instance_name_tag" {
  description = "EC2 instance name tag"
  type        = string
}

variable "enable_provisioner" {
  description = "Flag to enable or disable the provisioner"
  type        = bool
  default     = false
}

variable "ec2_ssh_user" {
  description = "The SSH user to connect to the instance"
  type        = string

  validation {
    condition     = var.enable_provisioner == false || (var.enable_provisioner == true && length(var.ec2_ssh_user) > 0)
    error_message = "If enable_provisioner is true, ec2_ssh_user must be provided."
  }
}

variable "private_key_path" {
  description = "Path to the private key for SSH"
  type        = string

  validation {
    condition     = var.enable_provisioner == false || (var.enable_provisioner == true && length(var.private_key_path) > 0)
    error_message = "If enable_provisioner is true, private_key_path must be provided."
  }
}

variable "docker_image" {
  description = "EC2 provisioner commands"
  type        = string

  validation {
    condition     = var.enable_provisioner == false || (var.enable_provisioner == true && length(var.docker_image) > 0)
    error_message = "If enable_provisioner is true, docker_image must be provided."
  }
}

variable "ec2_associate_public_ip_address" {
  description = "Associate public IP to EC2"
  type        = bool
  default     = false

}

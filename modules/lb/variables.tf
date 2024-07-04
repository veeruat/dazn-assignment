variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

variable "aws_security_group_id" {
  description = "SG ID"
  type        = list(string)
}

variable "lb_name" {
  description = "Application LB name"
  type        = string
  default     = "dazn-app-lb"
}

variable "app_lb_tg_gp_name" {
  description = "LB targer group name"
  type        = string
  default     = "dazn-lb-tg"
}

variable "lb_port" {
  description = "LB port"
  type        = number
  default     = 80
}

variable "lb_protocol" {
  description = "LB protocol"
  type        = string
  default     = "HTTP"
}

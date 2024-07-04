variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "IP addresses allowed to SSH into the instance"
  type        = list(string)
}

variable "prefix" {
  description = "APP name prefix"
  default     = "dazn"
}

variable "http_from_port" {
  type    = number
  default = 80
}

variable "http_to_port" {
  type    = number
  default = 80
}

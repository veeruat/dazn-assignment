variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "prefix" {
  description = "APP name prefix"
  default     = "dazn"
}

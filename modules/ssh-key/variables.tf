variable "public_key_path" {
  description = "Path to the public key to be used for SSH access"
  type        = string
}

variable "ec2_key_name" {
  type    = string
  default = "dazn_ec2_pub_key"
}

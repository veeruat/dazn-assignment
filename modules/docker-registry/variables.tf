variable "ecr_repo_name" {
  description = "ECR repo name"
  type        = string
}

variable "local_exec_enable" {
  description = "Flag to enable or disable the provisioner"
  type        = bool
  default     = false
}

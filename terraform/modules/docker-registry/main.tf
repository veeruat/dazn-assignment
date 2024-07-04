# ECR repository
resource "aws_ecr_repository" "ecr_repo" {
  name         = var.ecr_repo_name
  force_delete = false
}


# Local exec provisioner
resource "null_resource" "docker_local_exec" {
  count = var.local_exec_enable ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr_repo.repository_url} && \
      docker build -t ${aws_ecr_repository.ecr_repo.repository_url}:latest ../ && \
      docker push ${aws_ecr_repository.ecr_repo.repository_url}:latest
    EOT
  }

  depends_on = [aws_ecr_repository.ecr_repo]
}

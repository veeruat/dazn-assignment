# IAM instance profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = var.ec2_instance_role_name
}

# EC2 instance
resource "aws_instance" "ec2_instance_1" {
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  vpc_security_group_ids      = var.ec2_security_group_ids
  subnet_id                   = var.ec2_subnet_id
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.id
  associate_public_ip_address = var.ec2_associate_public_ip_address

  tags = {
    Name = var.ec2_instance_name_tag
  }
}

# Provisioner to execute commands post instance deployment.
resource "null_resource" "provisioner" {
  count = var.enable_provisioner ? 1 : 0

  connection {
    type        = "ssh"
    user        = var.ec2_ssh_user
    private_key = file(var.private_key_path)
    host        = aws_instance.ec2_instance_1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install docker -y",
      "sudo groupadd docker || true",
      "sudo usermod -aG docker ${var.ec2_ssh_user}",
      "sudo service docker start",
      "sudo -u ${var.ec2_ssh_user} -H sh -c 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${var.docker_image}'",
      "sudo -u ${var.ec2_ssh_user} -H sh -c 'docker pull ${var.docker_image}'",
      "sudo -u ${var.ec2_ssh_user} -H sh -c 'docker run -d -p 80:80 ${var.docker_image}'"
    ]
  }
}

resource "aws_security_group" "ec2_sg" {
  name   = "${var.prefix}_app_instance_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  ingress {
    from_port       = var.http_from_port
    to_port         = var.http_to_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}_app_instance_sg"
  }
}

resource "aws_security_group" "lb_sg" {
  name   = "${var.prefix}_lb_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.http_from_port
    to_port     = var.http_to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}_lb_sg"
  }
}

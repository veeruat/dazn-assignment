resource "aws_lb" "application_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.aws_security_group_id
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "app_lb_tg_gp" {
  name     = var.app_lb_tg_gp_name
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-399"
  }

  tags = {
    Name = var.app_lb_tg_gp_name
  }
}

resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tg_gp.arn
  }
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.app_lb_tg_gp.arn
  target_id        = var.instance_id
  port             = var.lb_port
}

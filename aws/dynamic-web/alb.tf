resource "aws_lb" "dynamic_web_alb" {
  name               = "dynamic-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnet_mapping {
    subnet_id     = aws_subnet.public_web_subnet_az1.id
  }
  subnet_mapping {
    subnet_id     = aws_subnet.public_web_subnet_az2.id
  }

  enable_deletion_protection = true

  tags = {
    Environment = "dynamic_web_alb"
  }
}

resource "aws_lb_target_group" "dynamic_web_alb_target_group" {
  name        = "dynamic-web-alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.dynamic_web_vpc.id
  target_type = "instance"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    path                = "/"
  }
}

resource "aws_lb_listener" "front_end_listener" {
  load_balancer_arn = aws_lb.dynamic_web_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dynamic_web_alb_target_group.arn
  }
}
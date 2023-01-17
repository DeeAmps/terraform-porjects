resource "aws_lb" "dynamic_web_alb" {
  name               = "dynamic-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [aws_subnet.public_web_subnet_az1.id, aws_subnet.public_web_subnet_az2.id]

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
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dynamic_web_alb_target_group.arn
  }
}
resource "aws_lb" "alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_web.id]
  subnets            = ["subnet-76a76710", "subnet-e9458ac8"]

  tags = {
    "Name"      = "scn"
    "aplicacao" = "demo"
    "ambiente"  = "dev"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "alb-target-tf"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
  #   stickiness {
  #     type = "lb_cookie"
  #   }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

# Registered targets
resource "aws_lb_target_group_attachment" "rtg1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.semanacloud.id
  port             = 80
}

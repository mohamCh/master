resource "aws_lb" "my_load_balancer" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets = [
    aws_subnet.my_subnet1.id,
    aws_subnet.my_subnet2.id,
    aws_subnet.my_subnet3.id
  ]

  security_groups = [
    aws_security_group.my_security_group.id
  ]

  tags = {
    Name = "LBMchalhi"
  }
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-299"
  }
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

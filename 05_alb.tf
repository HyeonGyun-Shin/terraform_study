resource "aws_lb" "hgshin_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.hgshin_sg.id]
  subnets = [aws_subnet.hgshin_pub[0].id, aws_subnet.hgshin_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  }
}

output "dns_name" {
  value = aws_lb.hgshin_alb.dns_name
}

resource "aws_lb_target_group" "hgshin_albtg" {
  name        = "${var.name}-albtg"
  port        = var.port_http
  protocol    = var.HTTP
  target_type = "instance"
  vpc_id      = aws_vpc.hgshin_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = var.HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "hgshin_alblis" {
  load_balancer_arn = aws_lb.hgshin_alb.arn
  port = var.port_http
  protocol = var.HTTP
  
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.hgshin_albtg.arn
  }
}

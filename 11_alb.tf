resource "aws_lb" "hgshin_alb" {
  name = "hgshin-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.hgshin_sg.id]
  subnets = [aws_subnet.hgshin_puba.id, aws_subnet.hgshin_pubc.id]
  tags = {
    "Name" = "hgshin-alb"
  }
}

output "dns_name" {
  value = aws_lb.hgshin_alb.dns_name
}
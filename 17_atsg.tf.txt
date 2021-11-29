resource "aws_placement_group" "hgshin-pg" {
  name = "hgshin-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hgshin-atsg" {
  name = "hgshin-atsg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 60
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  #placement_group = aws_placement_group.hgshin-pg.id
  launch_configuration = aws_launch_configuration.hgshin_lacf.name
  vpc_zone_identifier = [aws_subnet.hgshin_puba.id,aws_subnet.hgshin_pubc.id]
}
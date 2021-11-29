resource "aws_launch_configuration" "hgshin_lacf" {
  name = "${var.name}-lacf"
  image_id = aws_ami_from_instance.hgshin_ami.id
  instance_type = var.ins_type
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.hgshin_sg.id]
  key_name = "${var.name}-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}

resource "aws_placement_group" "hgshin-pg" {
  name = "${var.name}-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hgshin-atsg" {
  name = "${var.name}-atsg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 60
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  #placement_group = aws_placement_group.hgshin-pg.id
  launch_configuration = aws_launch_configuration.hgshin_lacf.name
  vpc_zone_identifier = [aws_subnet.hgshin_pub[0].id,aws_subnet.hgshin_pub[1].id]
}

resource "aws_autoscaling_attachment" "hgshin_asatt" {
  autoscaling_group_name = aws_autoscaling_group.hgshin-atsg.id
  alb_target_group_arn   = aws_lb_target_group.hgshin_albtg.arn
}


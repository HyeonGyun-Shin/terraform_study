resource "aws_autoscaling_attachment" "hgshin_asatt" {
  autoscaling_group_name = aws_autoscaling_group.hgshin-atsg.id
  alb_target_group_arn   = aws_lb_target_group.hgshin_albtg.arn
}


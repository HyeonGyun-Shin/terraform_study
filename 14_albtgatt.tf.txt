resource "aws_lb_target_group_attachment" "hgshin_albtgatt" {
  target_group_arn = aws_lb_target_group.hgshin_albtg.arn
  target_id        = aws_instance.hgshin_web.id
  port             = 80
}

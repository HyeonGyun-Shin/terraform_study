resource "aws_launch_configuration" "hgshin_lacf" {
  name = "hgshin-lacf"
  image_id = aws_ami_from_instance.hgshin_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.hgshin_sg.id]
  key_name = "hgshin-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}
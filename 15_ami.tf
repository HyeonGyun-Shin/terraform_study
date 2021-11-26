resource "aws_ami_from_instance" "hgshin_ami" {
    name = "hgshin-ami"
    source_instance_id = aws_instance.hgshin_web.id
    depends_on = [
      aws_instance.hgshin_web
    ]
}
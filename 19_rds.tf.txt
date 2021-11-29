resource "aws_db_instance" "hgshin_mydb" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  identifier             = "mydb"
  username               = "admin"
  password               = "lee3861421"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.hgshin_dbsg.id
  vpc_security_group_ids = [aws_security_group.hgshin_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "hgshin-db"
  }
}

resource "aws_db_subnet_group" "hgshin_dbsg" {
    name = "hgshin-dbsg"
    subnet_ids = [aws_subnet.hgshin_pridba.id,aws_subnet.hgshin_pridbc.id]
}

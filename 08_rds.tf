resource "aws_db_instance" "hgshin_mydb" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = var.mysql
  engine_version         = "8.0"
  instance_class         = "db.${var.ins_type}"
  name                   = "mydb"
  identifier             = "mydb"
  username               = "admin"
  password               = "lee3861421"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.hgshin_dbsg.id
  vpc_security_group_ids = [aws_security_group.hgshin_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "${var.name}-db"
  }
}

resource "aws_db_subnet_group" "hgshin_dbsg" {
    name = "${var.name}-dbsg"
    subnet_ids = [aws_subnet.hgshin_pridb[0].id,aws_subnet.hgshin_pridb[1].id]
}

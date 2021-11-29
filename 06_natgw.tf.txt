resource "aws_eip" "hgshin_ngw_ip" {
    vpc = true
}

resource "aws_nat_gateway" "hgshin_ngw" {
  allocation_id = aws_eip.hgshin_ngw_ip.id
  subnet_id = aws_subnet.hgshin_puba.id
  tags = {
    "Name" = "hgshin-ngw"
  }
}
resource "aws_route_table" "hgshin-rt" {
  vpc_id = aws_vpc.hgshin_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.hgshin_ig.id
  }
  tags = {
    "Name" = "hgshin-rt"
  }
}
resource "aws_internet_gateway" "hgshin_ig" {
  vpc_id = aws_vpc.hgshin_vpc.id

  tags = {
      "Name" = "${var.name}_ig"
  }
}

resource "aws_route_table" "hgshin-rt" {
  vpc_id = aws_vpc.hgshin_vpc.id

  route {
      cidr_block = var.cidr_route
      gateway_id = aws_internet_gateway.hgshin_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "hgshin_igas_pub" {
  count = 2
  subnet_id = aws_subnet.hgshin_pub[count.index].id
  route_table_id = aws_route_table.hgshin-rt.id
}
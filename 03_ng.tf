resource "aws_eip" "hgshin_ngw_ip" {
    vpc = true
}

resource "aws_nat_gateway" "hgshin_ngw" {
  allocation_id = aws_eip.hgshin_ngw_ip.id
  subnet_id = aws_subnet.hgshin_pub[0].id
  tags = {
    "Name" = "${var.name}-ngw"
  }
}

resource "aws_route_table" "hgshin_ngwrt" {
    vpc_id = aws_vpc.hgshin_vpc.id
    
    route {
        cidr_block = var.cidr_route
        gateway_id = aws_nat_gateway.hgshin_ngw.id
    }
    tags = {
      "Name" = "${var.name}-ngwrt"
    }
}

resource "aws_route_table_association" "hgshin_ngw_pri" {
    count = length(var.pri_sub)
    subnet_id = aws_subnet.hgshin_pri[count.index].id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}

resource "aws_route_table_association" "hgshin_ngw_pridb" {
    count = length(var.pri_subdb)
    subnet_id = aws_subnet.hgshin_pridb[count.index].id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}
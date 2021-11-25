resource "aws_route_table" "hgshin_ngwrt" {
    vpc_id = aws_vpc.hgshin_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.hgshin_ngw.id
    }
    tags = {
      "Name" = "hgshin-ngwrt"
    }
}
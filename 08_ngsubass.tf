resource "aws_route_table_association" "hgshin_ngw_pria" {
    subnet_id = aws_subnet.hgshin_pria.id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}

resource "aws_route_table_association" "hgshin_ngw_pric" {
    subnet_id = aws_subnet.hgshin_pric.id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}

resource "aws_route_table_association" "hgshin_ngw_pridba" {
    subnet_id = aws_subnet.hgshin_pridba.id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}

resource "aws_route_table_association" "hgshin_ngw_pridbc" {
    subnet_id = aws_subnet.hgshin_pridbc.id
    route_table_id = aws_route_table.hgshin_ngwrt.id
}
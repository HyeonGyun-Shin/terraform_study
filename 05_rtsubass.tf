resource "aws_route_table_association" "hgshin_igas_puba" {
  subnet_id = aws_subnet.hgshin_puba.id
  route_table_id = aws_route_table.hgshin-rt.id
}

resource "aws_route_table_association" "hgshin_igas_pubc" {
  subnet_id = aws_subnet.hgshin_pubc.id
  route_table_id = aws_route_table.hgshin-rt.id
}
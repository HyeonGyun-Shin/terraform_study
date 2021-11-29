resource "aws_internet_gateway" "hgshin_ig" {
  vpc_id = aws_vpc.hgshin_vpc.id

  tags = {
      "Name" = "hgshin_ig"
  }
}
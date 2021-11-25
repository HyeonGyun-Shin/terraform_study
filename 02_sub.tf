# 가용 영역 a의 public subnet
resource "aws_subnet" "hgshin_puba" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hgshin-puba"
  }
}
# 가용 영역 c의 public subnet
resource "aws_subnet" "hgshin_pubc" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hgshin-pubc"
  }
}
# 가용 영역 a의 private subnet
resource "aws_subnet" "hgshin_pria" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hgshin-pria"
  }
}
# 가용 영역 c의 private subnet
resource "aws_subnet" "hgshin_pric" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hgshin-pric"
  }
}
# 가용영역 a의 Database subnet
resource "aws_subnet" "hgshin_pridba" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hgshin-pridba"
  }
}
# 가용영역 c의 Database subnet
resource "aws_subnet" "hgshin_pridbc" {
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hgshin-pridbc"
  }
}

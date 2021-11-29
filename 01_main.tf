provider "aws" {
  region = var.region
}

resource "aws_key_pair" "hgshin_key" {
  key_name   = var.key
  public_key = file("../../.ssh/hgshin-key.pub")
}

resource "aws_vpc" "hgshin_vpc" {
  cidr_block           = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "hgshin-vpc"
  }
}

# 가용 영역 a의 public subnet
resource "aws_subnet" "hgshin_pub" {
  count             = length(var.pub_sub)   #2
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = var.pub_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}" 
  tags = {
    "Name" = "${var.name}-pub${var.ava_zone[count.index]}"
  }
}
# 가용 영역 a의 private subnet
resource "aws_subnet" "hgshin_pri" {
  count = length(var.pri_sub)
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava_zone[count.index]}"
  }
}

# 가용영역 a의 Database subnet
resource "aws_subnet" "hgshin_pridb" {
  count = length(var.pri_subdb)
  vpc_id            = aws_vpc.hgshin_vpc.id
  cidr_block        = var.pri_subdb[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava_zone[count.index]}"
  }
}

provider aws {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr[0].cidr
  map_public_ip_on_launch = true # enable the public_ip
  availability_zone = "${var.region}a" # == "us-east-2a"

  tags = {
    Name = var.subnet_cidr[0].subnet_name
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr[1].cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"

  tags = {
    Name = var.subnet_cidr[1].subnet_name
  }
}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr[2].cidr
  map_public_ip_on_launch = true
  availability_zone = "${var.region}c"

  tags = {
    Name = var.subnet_cidr[2].subnet_name
  }
}



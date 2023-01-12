resource "aws_subnet" "public_web_subnet_az1" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_web_subnet_az1"
  }
}

resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"


  tags = {
    Name = "private_app_subnet_az1"
  }
}

resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"


  tags = {
    Name = "private_data_subnet_az1"
  }
}

resource "aws_subnet" "public_web_subnet_az2" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "public_web_subnet_az2"
  }
}

resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"


  tags = {
    Name = "private_app_subnet_az2"
  }
}

resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id     = aws_vpc.dynamic_web_vpc.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "private_data_subnet_az2"
  }
}
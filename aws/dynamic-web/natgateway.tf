resource "aws_nat_gateway" "public_web_subnet_az1_nat" {
  subnet_id     = aws_subnet.public_web_subnet_az1.id

  tags = {
    Name = "public_web_subnet_az1_nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dynamic_web_vpc_igw]
}

resource "aws_nat_gateway" "public_web_subnet_az2_nat" {
  subnet_id     = aws_subnet.public_web_subnet_az2.id

  tags = {
    Name = "public_web_subnet_az2_nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dynamic_web_vpc_igw]
}
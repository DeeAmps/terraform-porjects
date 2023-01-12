resource "aws_route_table" "public_web_rt" {
  vpc_id = aws_vpc.dynamic_web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dynamic_web_vpc_igw.id
  }

  tags = {
    Name = "public_web_rt"
  }
}

resource "aws_route_table" "private_app_rt_az1" {
  vpc_id = aws_vpc.dynamic_web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.public_web_subnet_az1_nat.id
  }

  tags = {
    Name = "private_app_rt_az1"
  }
}

resource "aws_route_table" "private_app_rt_az2" {
  vpc_id = aws_vpc.dynamic_web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.public_web_subnet_az2_nat.id
  }

  tags = {
    Name = "private_app_rt_az2"
  }
}

resource "aws_route_table_association" "public_az1_rt_association" {
  subnet_id      = aws_subnet.public_web_subnet_az1.id
  route_table_id = aws_route_table.public_web_rt.id
}

resource "aws_route_table_association" "public_az2_rt_association" {
  subnet_id      = aws_subnet.public_web_subnet_az2.id
  route_table_id = aws_route_table.public_web_rt.id
}

resource "aws_route_table_association" "private_app_nat_az1_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_app_rt_az1.id
}

resource "aws_route_table_association" "private_app_nat_az2_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.public_web_rt.id
}
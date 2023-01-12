resource "aws_internet_gateway" "dynamic_web_vpc_igw" {}

resource "aws_internet_gateway_attachment" "dynamic_web_vpc_igw_attachment" {
  internet_gateway_id = aws_internet_gateway.dynamic_web_vpc_igw.id
  vpc_id              = aws_vpc.dynamic_web_vpc.id
}
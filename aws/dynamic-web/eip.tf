resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc = true

  tags = {
    "Name" = "nat gatewat az1 eip"
  }
}

resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc = true

  tags = {
    "Name" = "nat gatewat az2 eip"
  }
}

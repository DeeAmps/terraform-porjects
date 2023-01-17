output "vpc_id" {
    value = aws_vpc.dynamic_web_vpc.id
}

output "public_web_subnet_az1_id" {
    value = aws_subnet.public_web_subnet_az1.id
}

output "public_web_subnet_az2_id" {
    value = aws_subnet.public_web_subnet_az2.id
}

output "load_balance_dsn_name" {
    value = aws_lb.dynamic_web_alb.dns_name
}
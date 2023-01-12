resource "aws_security_group" "ssh_security_group" {
  name        = "ssh_security_group"
  description = "ssh_security_group"
  vpc_id      = aws_vpc.dynamic_web_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  tags = {
    Name = "ssh_security_group"
  }
}

resource "aws_security_group" "alb_security_group" {
  name        = "alb_security_group"
  description = "alb_security_group"
  vpc_id      = aws_vpc.dynamic_web_vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  tags = {
    Name = "alb_security_group"
  }
}


resource "aws_security_group" "webserver_security_group" {
  name        = "alb_security_group"
  description = "alb_security_group"
  vpc_id      = aws_vpc.dynamic_web_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  tags = {
    Name = "alb_security_group"
  }
}

resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "db_security_group"
  vpc_id      = aws_vpc.dynamic_web_vpc.id

  ingress {
    description      = "MySQL Server"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.dynamic_web_vpc.cidr_block]
  }

  tags = {
    Name = "db_security_group"
  }
}
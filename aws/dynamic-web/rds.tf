resource "aws_db_subnet_group" "data_subnets" {
  name       = "data_subnets"
  subnet_ids = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
}


resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "terra"
  engine                 = var.var_db.dbEngine
  availability_zone      = var.var_db.dbAvailabilityZone
  engine_version         = var.var_db.dbEngineVersion
  instance_class         = var.var_db.dbInstanceClass
  username               = var.var_db_username
  password               = var.var_db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.data_subnets.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
}
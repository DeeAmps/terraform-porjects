variable "var_aws_region" {
  type = string
}

variable "var_aws_profile" {
  type = string
}

variable "var_db" {
  type = map(string)
}

variable "var_db_password" {
  type      = string
  sensitive = true
}

variable "var_db_username" {
  type = string
}
variable "var_operator_email" {
  type = string
}


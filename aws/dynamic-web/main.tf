resource "aws_s3_bucket" "state_backend_bucket" {
  bucket = "terraform-state-backend20230108"
  tags = {
    Name        = "terraform-state-backend20230108"
  }
}

resource "aws_s3_bucket_acl" "state_backend_bucket_acl" {
  bucket = aws_s3_bucket.state_backend_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "state_backend_bucket_versioning" {
  bucket = aws_s3_bucket.state_backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "terraform_state"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
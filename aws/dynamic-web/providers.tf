terraform {
    required_version = ">= 0.12.0"
    backend "s3" {
        bucket         = "terraform-state-backend20230108"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform_state"
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 2.0.0"
        }
    }
}

provider "aws" {
  region = var.var_aws_region
  profile = var.var_aws_profile
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-2"

  assume_role {
    role_arn = "arn:aws:iam::500511648355:user/terraform-user"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "global-terraform-testing-state-backend"
    dynamodb_table = "global-terraform-testing-state-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
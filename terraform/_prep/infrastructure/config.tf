terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "global-terraform-testing-state-backend"
    key            = "infrastructure/state"
    dynamodb_table = "global-terraform-testing-state-lock"
    region         = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "prod-terraform-testing-state-backend"
    key            = "prod-state/state"
    dynamodb_table = "prod-terraform-testing-state-lock"
    region         = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
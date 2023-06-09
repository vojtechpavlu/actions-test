terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "dev-terraform-testing-state-backend"
    key            = "dev-state/state"
    dynamodb_table = "dev-terraform-testing-state-lock"
    region         = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
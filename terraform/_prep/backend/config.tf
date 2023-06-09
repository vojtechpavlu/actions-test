terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the aws provider
provider "aws" {
  region = "us-east-1"   # Set the default region
}
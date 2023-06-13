resource "aws_vpc" "created_vpc" {
  cidr_block           = var.ip_cidr_range
  enable_dns_hostnames = true   # Enables DNS hostname assignment

  tags = {
    Name = var.vpc_name
  }
}
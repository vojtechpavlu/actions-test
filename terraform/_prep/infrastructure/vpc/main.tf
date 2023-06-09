resource "aws_vpc" "created_vpc" {
  cidr_block = var.ip_cidr_range

  tags = {
    Name = var.vpc_name
  }
}
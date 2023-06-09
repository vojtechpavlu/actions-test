resource "aws_vpc" "created_vpc" {
  associate_public_ip_address = true
  cidr_block                  = var.ip_cidr_range

  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "created_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.ip_cidr_range
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}
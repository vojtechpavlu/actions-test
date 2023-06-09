resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id
  tags   = {
    Name = var.ig_name
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags   = {
    Name = var.rt_name
  }
}

module "routes" {
  source = "./route"

  for_each = {
    for index, subnet in var.subnets :
      subnet.subnet_id => subnet
  }

  ig_id          = aws_internet_gateway.ig
  route_table_id = aws_route_table.route_table.id
  cidr_blocks    = each.value.cidr_blocks
  subnet_id      = each.value.subnet_id
}
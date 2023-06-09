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

  count = length(var.subnets)

  ig_id          = aws_internet_gateway.ig.id
  route_table_id = aws_route_table.route_table.id
  cidr_blocks    = ["0.0.0.0/0"]
  subnet_id      = var.subnets[count.index].subnet_id
}
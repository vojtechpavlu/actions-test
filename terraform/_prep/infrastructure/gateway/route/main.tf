resource "aws_route" "route" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.cidr_blocks[0]
  gateway_id             = var.ig_id
}

resource "aws_route_table_association" "association" {
  route_table_id = var.route_table_id
  subnet_id      = var.subnet_id
}
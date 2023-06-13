resource "aws_security_group" "sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id
}

module "ingress_tls" {
  source      = "./sg_rule"
  count       = var.allow_tls ? 1 : 0
  cidr_blocks = var.tls_ingress_cidr
  port        = 443
  protocol    = "tcp"
  rule_type   = "ingress"
  sg_id       = aws_security_group.sg.id
}

module "ingress_ssh" {
  source      = "./sg_rule"
  count       = var.allow_ssh ? 1 : 0
  cidr_blocks = var.ssh_ingress_cidr
  port        = 22
  protocol    = "tcp"
  rule_type   = "ingress"
  sg_id       = aws_security_group.sg.id
}

module "ingress_http" {
  source      = "./sg_rule"
  count       = var.allow_http ? 1 : 0
  cidr_blocks = var.http_ingress_cidr
  port        = 8080
  protocol    = "tcp"
  rule_type   = "ingress"
  sg_id       = aws_security_group.sg.id
}

module "ingress_http_80" {
  source      = "./sg_rule"
  count       = var.allow_http_80 ? 1 : 0
  cidr_blocks = var.http_ingress_cidr
  port        = 80
  protocol    = "tcp"
  rule_type   = "ingress"
  sg_id       = aws_security_group.sg.id
}

module "egress_all" {
  source      = "./sg_rule"
  cidr_blocks = var.egress_cidr
  port        = 0
  protocol    = "-1"
  rule_type   = "egress"
  sg_id       = aws_security_group.sg.id
}

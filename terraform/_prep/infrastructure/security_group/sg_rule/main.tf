variable "port" {
  type        = number
  description = "Port of the rule"
}

variable "protocol" {
  type        = string
  description = "Used protocol"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "Allowed CIDR blocks"
}

variable "sg_id" {
  type        = string
  description = "ID of the SG this rule is assigned to"
}

variable "rule_type" {
  type        = string
  description = "Type of the rule (ingress or egress)"
}

resource "aws_security_group_rule" "sg_rule" {
  from_port         = var.port
  to_port           = var.port
  protocol          = var.protocol
  security_group_id = var.sg_id
  type              = var.rule_type
  cidr_blocks       = var.cidr_blocks
}

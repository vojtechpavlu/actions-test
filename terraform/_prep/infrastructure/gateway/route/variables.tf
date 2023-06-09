variable "route_table_id" {
  type        = string
  description = "ID of the Route Table"
}

variable "subnet_id" {
  type        = string
  description = "ID of the Subnet"
}

variable "ig_id" {
  type        = string
  description = "ID of the Internet Gateway"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "CIDR block of the subnet"
}
variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "ig_name" {
  type        = string
  description = "Name of the Internet Gateway"
}

variable "rt_name" {
  type        = string
  description = "Name of the Route Table"
}

variable "subnets" {
  type = list(object({
    subnet_id   = string
    name        = string
    cidr_blocks = list(string)
  }))
  description = "Destination CIDR blocks for routing table"
}
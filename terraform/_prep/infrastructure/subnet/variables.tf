variable "ip_cidr_range" {
  type        = string
  description = "CIDR Range"
}

variable "subnet_name" {
  type        = string
  description = "Name of this subnet"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC this subnet belongs to"
}
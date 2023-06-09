variable "ip_cidr_range" {
  type        = string
  description = "CIDR Range"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "prepared-by-gh-tf"
}
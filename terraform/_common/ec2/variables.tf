variable "environment" {
  type        = string
  description = "Type of the environment this instance should be deployed to"
}

variable "instance_name" {
  type        = string
  description = "Name of the instance"
}

variable "ami" {
  type        = string
  description = "Amazon Machine Image to be used for the EC2"
  default     = "ami-04a0ae173da5807d3"
}

variable "instance_type" {
  type        = string
  description = "Type of the instance"
  default     = "t2.micro"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security Groups this EC2 instance belongs to"
}

variable "subnet_id" {
  type        = string
  description = "Subnet this EC2 instance belongs to"
}

variable "key_name" {
  type        = string
  description = "Name of the key used for SSH connection"
}
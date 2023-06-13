variable "sg_name" {
  type        = string
  description = "Name of the SG"
}

variable "vpc_id" {
  type        = string
  description = "VPC this SG belongs to"
}

variable "allow_tls" {
  type        = bool
  description = "If should be TLS (port 443) allowed or not"
  default     = true
}

variable "allow_ssh" {
  type        = bool
  description = "If should be SSH (port 22) allowed or not"
  default     = true
}

variable "allow_http" {
  type        = bool
  description = "If should be HTTP (port 8080) allowed or not"
  default     = true
}

variable "allow_http_80" {
  type        = bool
  description = "If should be HTTP (port 80) allowed or not"
  default     = true
}

variable "tls_ingress_cidr" {
  type        = list(string)
  description = "Who can send into with the SG via TLS"
  default     = ["0.0.0.0/0"]
}

variable "ssh_ingress_cidr" {
  type        = list(string)
  description = "Who can send into with the SG via SSH"
  default     = ["0.0.0.0/0"]
}

variable "http_ingress_cidr" {
  type        = list(string)
  description = "Who can send into with the SG via HTTP"
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr" {
  type        = list(string)
  description = "Who can this SG send data to"
  default     = ["0.0.0.0/0"]
}
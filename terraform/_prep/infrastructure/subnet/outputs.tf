output "subnet_id" {
  value = aws_subnet.created_subnet.id
}

output "subnet_name" {
  value = var.subnet_name
}

output "subnet_cidr" {
  value = var.ip_cidr_range
}
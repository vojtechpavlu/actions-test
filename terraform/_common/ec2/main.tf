resource "aws_instance" "webserver" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_group_ids
  subnet_id       = var.subnet_id
  key_name        = var.key_name
  user_data       = var.user_data

  tags = {
    Environment = var.environment
    Name        = var.instance_name
  }
}
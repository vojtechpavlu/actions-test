resource "aws_instance" "webserver" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_group_ids
  subnet_id       = var.subnet_id
  key_name        = var.key_name

  tags = {
    Environment = var.environment
    Name        = var.instance_name
  }
}
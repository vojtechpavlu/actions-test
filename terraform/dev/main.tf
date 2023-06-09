locals {
  environment        = "dev"
  security_group_ids = ["sg-050a13c7f0fa48f3d"]
  subnet_id          = "subnet-0cff04a73a00123eb"
  key_name           = "terraform-testing"
}

module "instance" {
  source = "../_common/ec2"

  environment        = local.environment
  instance_name      = "${local.environment}-terraform-instance"
  security_group_ids = local.security_group_ids
  subnet_id          = local.subnet_id
  key_name           = local.key_name
}

resource "local_file" "deployed_instance_metadata" {
  filename = "${path.module}/deployment_info.txt"
  content  = <<EOF
Instance ID: ${module.instance.instance_id}
Public DNS: ${module.instance.public_dns}
Public IP: ${module.instance.public_ip}
EOF
}
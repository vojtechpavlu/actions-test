locals {
  environment        = "dev"
  security_group_ids = ["sg-04fcbacd1edef6614"]
  subnet_id          = "subnet-0ad5fff9d6b1692ba"
  key_name           = "terraform-testing"
  latest_version     = "99"
  current_version    = var.override_version && var.parametric_version != "" ? var.parametric_version : local.latest_version
  repository         = "https://github.com/vojtechpavlu/testing-project.git"
  goto_folder        = "testing-project"
}

variable "override_version" {
  type        = bool
  description = "If the given version as a parameter should override the specified one"
  default     = false
}

variable "parametric_version" {
  type        = string
  description = "Given variable as a version"
  default     = ""
}

module "instance" {
  source = "../_common/ec2"

  environment        = local.environment
  instance_name      = "${local.environment}-terraform-instance"
  security_group_ids = local.security_group_ids
  subnet_id          = local.subnet_id
  key_name           = local.key_name

  user_data = <<EOF
#! /bin/sh
sudo yum update -y
sudo yum install docker -y
sudo yum install git -y

sudo service docker start
sudo systemctl enable docker.service
sudo systemctl start docker.service

git clone ${local.repository}
cd ${local.goto_folder}

sudo docker build . -t app
sudo docker run -e version='${local.current_version}' -p 80:8080 app

EOF
}

resource "local_file" "deployed_instance_metadata" {
  filename = "${path.module}/deployment_info.txt"
  content  = jsonencode({
    id  = module.instance.instance_id
    ip  = module.instance.public_ip
    dns = module.instance.public_dns
  })
}

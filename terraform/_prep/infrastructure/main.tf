module "vpc" {
  source        = "./vpc"
  ip_cidr_range = "10.0.0.0/16"
}

resource "local_file" "ids_of_resources" {
  filename = "${path.module}/infrastructure_ids.txt"
  content  = <<EOF
VPC ID: ${module.vpc.vpc_id}
DEV ID: ${module.dev_subnet.subnet_id}
TEST ID: ${module.test_subnet.subnet_id}
PROD ID: ${module.prod_subnet.subnet_id}
EOF
}

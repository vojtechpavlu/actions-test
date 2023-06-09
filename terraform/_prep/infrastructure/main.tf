module "vpc" {
  source        = "./vpc"
  ip_cidr_range = "10.0.0.0/16"
}

module "dev_subnet" {
  source        = "./subnet"
  ip_cidr_range = "10.0.0.0/20"
  subnet_name   = "dev-subnet"
  vpc_id        = module.vpc.vpc_id
}

module "test_subnet" {
  source        = "./subnet"
  ip_cidr_range = "10.0.128.0/20"
  subnet_name   = "test-subnet"
  vpc_id        = module.vpc.vpc_id
}

module "prod_subnet" {
  source        = "./subnet"
  ip_cidr_range = "10.0.144.0/20"
  subnet_name   = "prod-subnet"
  vpc_id        = module.vpc.vpc_id
}

module "gateway" {
  source  = "./gateway"
  vpc_id  = module.vpc.vpc_id
  ig_name = "TF-generated Internet Gateway"
  rt_name = "TF-generated Route Table"
  subnets = [
    {
      subnet_id   = module.dev_subnet.subnet_id
      name        = module.dev_subnet.subnet_name
      cidr_blocks = module.dev_subnet.subnet_cidr
    },
    {
      subnet_id   = module.test_subnet.subnet_id
      name        = module.test_subnet.subnet_name
      cidr_blocks = module.test_subnet.subnet_cidr
    },
    {
      subnet_id   = module.prod_subnet.subnet_id
      name        = module.prod_subnet.subnet_name
      cidr_blocks = module.prod_subnet.subnet_cidr
    }
  ]
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

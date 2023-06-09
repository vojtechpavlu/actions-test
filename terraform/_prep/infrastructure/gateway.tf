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
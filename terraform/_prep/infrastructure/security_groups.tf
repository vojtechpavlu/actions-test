module "dev_sg" {
  source  = "./security_group"
  sg_name = "dev_security_group"
  vpc_id  = module.vpc.vpc_id
}

module "test_sg" {
  source  = "./security_group"
  sg_name = "test_security_group"
  vpc_id  = module.vpc.vpc_id
}

module "prod_sg" {
  source  = "./security_group"
  sg_name = "prod_security_group"
  vpc_id  = module.vpc.vpc_id
}

module "manager_sg" {
  source  = "./security_group"
  sg_name = "manager_security_group"
  vpc_id  = module.vpc.vpc_id
}

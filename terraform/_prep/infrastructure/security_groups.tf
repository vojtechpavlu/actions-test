module "security_groups" {
  source = "./security_group"

  for_each = toset(["dev", "test", "prod"])

  sg_name = "${each.key}_security_group"
  vpc_id = module.vpc.vpc_id
}
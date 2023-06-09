locals {
  # Specification of environments for whom the backends should be prepared
  environment = var.environment
}

module "state_preparation" {
  source                = "./state"
  environment_name      = local.environment
}

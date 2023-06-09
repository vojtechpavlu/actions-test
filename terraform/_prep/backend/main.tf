locals {
  # Specification of environments for whom the backends should be prepared
  environment = var.environment
}

module "state_preparation" {
  source                = "./state"
  environment_name      = local.environment
}

resource "local_file" "state_output" {
  filename = "${path.module}/state_output.txt"
  content = <<EOF
S3 ID: ${module.state_preparation.s3_id}
S3 NAME: ${module.state_preparation.s3_bucket_domain_name}
DDB ID: ${module.state_preparation.ddb_id}
DDB NAME: ${module.state_preparation.ddb_name}
EOF
}
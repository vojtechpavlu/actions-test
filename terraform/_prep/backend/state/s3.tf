# For the given environment, create a S3 Bucket to store
# the current state of the deployables and deployed.
# The bucket can be found under name [environment]-terraform-testing-state-backend
resource "aws_s3_bucket" "terraform_s3_state" {
  bucket = "${var.environment_name}-terraform-testing-state-backend"
  tags = {
    Name = "S3 Remote Terraform State Store for ${var.environment_name} environment"
  }

  lifecycle {
    # Whoever tries to 'terraform destroy' this table, it won't pass.
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_s3_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
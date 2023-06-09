# For the given environment, create a DynamoDB locking
# table to achieve deployment security. The table can be found
# under name [environment]-terraform-testing-state-lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.environment_name}-terraform-testing-state-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "S3 Remote Terraform State Lock for ${var.environment_name} environment"
  }

  lifecycle {
    # Whoever tries to 'terraform destroy' this table, it won't pass.
    prevent_destroy = true
  }
}
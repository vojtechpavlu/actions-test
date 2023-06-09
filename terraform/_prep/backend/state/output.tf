output "s3_id" {
  value = aws_s3_bucket.terraform_s3_state.id
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.terraform_s3_state.bucket_domain_name
}

output "ddb_id" {
  value = aws_dynamodb_table.terraform_state_lock.id
}

output "ddb_name" {
  value = aws_dynamodb_table.terraform_state_lock.name
}
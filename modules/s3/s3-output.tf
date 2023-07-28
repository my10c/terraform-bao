output "s3_base_bucket_id" {
  value = aws_s3_bucket.ops_s3_base[*].id
}

output "s3_base_bucket_arn" {
  value = aws_s3_bucket.ops_s3_base[*].arn
}

output "s3_base_bucket_domain" {
  value = aws_s3_bucket.ops_s3_base[*].bucket_domain_name
}

output "s3_base_bucket_region" {
  value = aws_s3_bucket.ops_s3_base[*].region
}

output "s3_base_bucket_block_public_acls" {
  value = aws_s3_bucket_public_access_block.ops_s3_base[*].block_public_acls
}

output "s3_base_bucket_block_public_policy" {
  value = aws_s3_bucket_public_access_block.ops_s3_base[*].block_public_policy
}

output "s3_base_bucket_ignore_public_acls" {
  value = aws_s3_bucket_public_access_block.ops_s3_base[*].ignore_public_acls
}

output "s3_base_bucket_restrict_public_buckets" {
  value = aws_s3_bucket_public_access_block.ops_s3_base[*].restrict_public_buckets
}

output "s3_base_bucket_server_side_encryption_configuration" {
  value = aws_s3_bucket.ops_s3_base[*].server_side_encryption_configuration 
}


# s3 replicator variables
variable "s3_replication_role" {
  description = "iam role of the source bucket"
  type        = string
}

variable "s3_replication_id" {
  description = "the id of replication"
  type        = string
}

variable "s3_replication_kms_key" {
  description = "encrypt kms key id"
  type        = string
}

variable "s3_destination_bucket" {
  description = "destination bucket"
  type        = string
}

variable "s3_destination_account" {
  description = "account of the destination bucket"
  type        = string
}

output "s3_replicator_bucket_id" {
  value = aws_s3_bucket.ops_s3_replicator[*].id
}

output "s3_replicator_bucket_arn" {
  value = aws_s3_bucket.ops_s3_replicator[*].arn
}

output "s3_replicator_bucket_domain" {
  value = aws_s3_bucket.ops_s3_replicator[*].bucket_domain_name
}

output "s3_replicator_bucket_region" {
  value = aws_s3_bucket.ops_s3_replicator[*].region
}

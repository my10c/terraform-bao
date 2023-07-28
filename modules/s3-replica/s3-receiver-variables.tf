# s3 replicator variables
variable "s3_destination_aws_account" {
  description = "aws account of the source bucket"
  type        = string
}

variable "s3_replication_role" {
  description = "iam role of the source bucket"
  type        = string
}

variable "s3_destination_bucket" {
  description = "destination bucket"
  type        = string
}

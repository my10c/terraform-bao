
resource "aws_s3_bucket" "ops_s3" {
  count  = length(var.s3_buckets)
  bucket = element(var.s3_buckets, count.index)
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

 lifecycle_rule {
   id      = "${var.s3_expires_day[count.index]}-days-expires"
   enabled = true

   tags = {
     rule      = "${var.s3_expires_day[count.index]}-days-expires"
     autoclean = "true"
   }

   expiration {
     days = var.s3_expires_day[count.index]
   }

   noncurrent_version_expiration {
     days = var.s3_expires_day[count.index]
   }
 }

 versioning {
   enabled = "true"
 }

  # hard code for now : will need to be move in tvars filo
  replication_configuration {
    role   = var.s3_replication_role
    rules {
      id = var.s3_replication_id
      priority = 0
      status   = "Enabled"

      destination {
        account_id         = var.s3_destination_account
        bucket             = var.s3_destination_bucket
        replica_kms_key_id = var.s3_replication_kms_key
        access_control_translation {
          owner = "Destination"
        }
      }

      filter {}
      source_selection_criteria {
        sse_kms_encrypted_objects {
          enabled = "true"
        }
      }
    }
  }

 tags = {
    Name        = element(var.s3_buckets, count.index)
    terraform   = "true"
    environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "ops_s3" {
  count  = length(var.s3_buckets)
  bucket = aws_s3_bucket.ops_s3[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


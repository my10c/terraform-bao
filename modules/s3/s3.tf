
resource "aws_s3_bucket" "ops_s3_base" {
  count  = length(var.s3_base_buckets)
  bucket = element(var.s3_base_buckets, count.index)
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

 lifecycle_rule {
   id      = "${var.s3_base_expires_day[count.index]}-days-expires"
   enabled = true

   tags = {
     rule      = "${var.s3_base_expires_day[count.index]}-days-expires"
     autoclean = "true"
   }

   expiration {
     days = var.s3_base_expires_day[count.index]
   }
 }
}

resource "aws_s3_bucket_public_access_block" "ops_s3_base" {
  count  = length(var.s3_base_buckets)
  bucket = aws_s3_bucket.ops_s3_base[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

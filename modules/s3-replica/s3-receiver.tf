
resource "aws_s3_bucket" "ops_s3_receiver" {
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

policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReplicationFromDev",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::var.s3_source_account:role/source-s3-arifacts-replication"
            },
            "Action": [
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning",
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ObjectOwnerOverrideToBucketOwner"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_replication_source}",
                "arn:aws:s3:::${var.s3_replication_source}/*"
            ]
        }
    ]
}
 POLICY

 tags = {
    Name        = element(var.s3_buckets, count.index)
    terraform   = "true"
    environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "ops_s3_receiver" {
  count  = length(var.s3_buckets)
  bucket = aws_s3_bucket.ops_s3_receiver[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


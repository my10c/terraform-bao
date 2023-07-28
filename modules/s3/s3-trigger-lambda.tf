
variable s3_trigger_name   {}
variable s3_trigger_bucket {}
variable s3_trigger_lambda {}
variable s3_trigger_event  {}
variable s3_trigger_prefix {}
variable s3_trigger_suffix {}

locals {
  s3_trigger_id     = var.s3_trigger_name
  s3_trigger_bucket = var.s3_trigger_bucket
  s3_trigger_lambda = var.s3_trigger_lambda
  s3_trigger_event  = var.s3_trigger_event
  s3_trigger_prefix = var.s3_trigger_prefix
  s3_trigger_suffix = var.s3_trigger_suffix
}

data "aws_s3_bucket" "selected" {
  bucket = local.s3_trigger_bucket
}

resource "aws_lambda_permission" "legion_lambda" {
  depends_on = [
    data.aws_s3_bucket.selected
  ]

  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  principal     = "s3.amazonaws.com"
  function_name = local.s3_trigger_lambda
  source_arn    = data.aws_s3_bucket.selected.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  depends_on = [
    aws_lambda_permission.legion_lambda,
    data.aws_s3_bucket.selected
  ]

  bucket = local.s3_trigger_bucket

#
# TODO
# loop in the list of all variable2
#
  lambda_function {
    id                  = local.s3_trigger_id[0]
    lambda_function_arn = local.s3_trigger_lambda
    events              = local.s3_trigger_event[0]
    filter_prefix       = local.s3_trigger_prefix[0]
  }

  lambda_function {
    id                  = local.s3_trigger_id[1]
    lambda_function_arn = local.s3_trigger_lambda
    events              = local.s3_trigger_event[1]
    filter_prefix       = local.s3_trigger_prefix[1]
  }
}

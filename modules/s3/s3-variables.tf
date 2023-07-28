# s3 variables
variable "s3_base_buckets" {
  description = "name of the base s3 buckets to be created"
  type        = list(string)
}

variable "s3_base_lifecycle" {
  description = "enable the lifecycle rule"
  type        = list(string)
}

variable "s3_base_expires_day" {
  description = "days before objects expires in the s3 base buckets"
  type        = list(number)
}

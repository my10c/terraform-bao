# adm group variables
variable "acm_domains" {
  description = "main domain name for the certificate"
  type        = list(string)
}

variable "acm_validations" {
  description = "method of validation in order of the acm_domains variable"
  type        = list(string)
}

variable "acm_sans" {
  description = "the san domains to be add in order of the acm_domains variable"
  type        = list(list(string))
}

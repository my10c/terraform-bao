
resource "aws_acm_certificate" "ops" {
  count                     = length(var.acm_domains)
  domain_name               = var.acm_domains[count.index]
  validation_method         = var.acm_validations[count.index]
  subject_alternative_names = var.acm_sans[count.index]

  tags = {
    Name        = "${element(var.acm_domains, count.index)}"
    environment = var.environment
    terraform   = "true"
  }
}

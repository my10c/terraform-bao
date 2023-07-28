
output "acm_certificates_domains" {
  value = var.acm_domains
}

output "acm_certificates_sans" {
  value = var.acm_sans
}

output "acm_certificates_arn" {
  value = aws_acm_certificate.ops[*].arn
}

output "acm_certificates_id" {
  value = aws_acm_certificate.ops[*].id
}

output "acm_certificates_dns_record_name" {
  value = aws_acm_certificate.ops[*].domain_validation_options[*].resource_record_name
}

output "acm_certificates_dns_record_type" {
  value = aws_acm_certificate.ops[*].domain_validation_options[*].resource_record_type
}

output "acm_certificates_dns_record_value" {
  value = aws_acm_certificate.ops[*].domain_validation_options[*].resource_record_value
}


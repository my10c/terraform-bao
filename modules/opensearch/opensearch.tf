
# no module for OpenSerach yet
resource "aws_elasticsearch_domain" "ops" {

  count                  = length(local.es_domainnames)
  domain_name            = element(local.es_domainnames, count.index)
#
#  access_policies = <<POLICY
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Effect": "Allow",
#      "Action": [
#        "es:*",
#        "es:ESHttp*"
#      ]
#      "Principal": {
#        "AWS": "{local.aws_account}"
#      },
#      "Resource": "arn:aws:es:${local.aws_region}:${local.aws_account}:domain/${element(local.es_domainnames, count.index)}/*"
#    }
#  ]
#}
#POLICY

  tags = {
    Name        = element(local.es_domainnames, count.index)
    terraform   = "true"
    environment = local.environment
  }
}

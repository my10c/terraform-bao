
locals {

  osearch_ingress = [
    {
      from_port    = 9200
      to_port      = 9200
      description  = "OpenSearch Api port"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 9300
      to_port      = 9300
      description  = "OpenSearch Node port"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 443
      to_port      = 443
      description  = "OpenSearch HTTPS"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    }
  ]

  osearch_egress = [
    {
      from_port    = 0
      to_port      = 0
      description  = "All Traffic to VPC"
      protocol     = "-1"
      cidr_blocks  = [var.vpc_cidr]
    },
  ]
}

resource "aws_security_group" "osearch" {
  depends_on = [
    module.vpc
  ]

  name   = "${local.tag_name}-osearch"
  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = local.osearch_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.osearch_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      description = egress.value.description
      cidr_blocks = egress.value.cidr_blocks
    }
  }

 tags = {
    Name        = "${local.tag_name}-osearch"
    environment = var.environment
    terraform   = "true"
  }
}

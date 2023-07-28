
locals {
  devops_ingress = [
    {
      from_port    = 22
      to_port      = 22
      description  = "SSH"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 80
      to_port      = 80
      description  = "HTTP"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 443
      to_port      = 443
      description  = "HTTPS"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 389
      to_port      = 389
      description  = "LDAP"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 9411
      to_port      = 9411
      description  = "otel-collector"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_private_cidr]
    },
    {
      from_port    = 4900
      to_port      = 4900
      description  = "data-prepper admin"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_cidr]
    },
    {
      from_port    = 21890
      to_port      = 21890
      description  = "data-prepper"
      protocol     = "tcp"
      cidr_blocks  = [var.vpc_private_cidr]
    },
    {
      from_port    = -1
      to_port      = -1
      description = "ICMP"
      protocol    = "icmp"
      cidr_blocks = [var.vpc_cidr]
    }
  ]

  devops_egress = [
    {
      from_port    = 0
      to_port      = 0
      description  = "All Traffic"
      protocol     = -1
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

resource "aws_security_group" "devops" {
  name   = "${local.tag_name}-devops"
  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = local.devops_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.devops_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      description = egress.value.description
      cidr_blocks = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }

 tags = {
    Name        = "${local.tag_name}-devops"
    environment = var.environment
    terraform   = "true"
  }
}

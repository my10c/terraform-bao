
locals {
   pfsense_wan = [
    {
      from_port   = 0
      to_port     = 0
      description = "Allow from VPC"
      protocol    = "-1"
      cidr_blocks = [var.vpc_cidr]
    },
    {
      from_port   = 22
      to_port     = 22
      description = "SSH Allow only for DevOPS team"
      protocol    = "tcp"
      cidr_blocks = var.pfsense_admin_ips
    },
    {
      from_port   = 8443
      to_port     = 8443
      description = "HTTPS Allow only for DevOPS team"
      protocol    = "tcp"
      cidr_blocks = var.pfsense_admin_ips
    },
    {
      from_port   = var.pfsense_vpn_tcp_port
      to_port     = var.pfsense_vpn_tcp_port
      description = "Allow OpenVPN TCP"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = var.pfsense_vpn_udp_port
      to_port     = var.pfsense_vpn_udp_port
      description = "Allow OpenVPN UDP"
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }]

   pfsense_lan = [
    {
      from_port   = 0
      to_port     = 0
      description = "Allow from VPC"
      protocol    = "-1"
      cidr_blocks = [var.vpc_cidr]
    }]
}

resource "aws_security_group" "pfsense_wan" {
  name       = "${local.tag_name}-pfsense_wan"

  # attach the security group to the specific vpc, required value
  vpc_id = module.vpc.vpc_id

  # create the tags
  tags = {
    Name        = "${local.tag_name}-pfsense_wan"
    environment = var.environment
	cloudregion = var.cloudregion
    terraform   = "true"
  }

  dynamic "ingress" {
    for_each = local.pfsense_wan
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "pfsense_lan" {
  name       = "${local.tag_name}-pfsense_lan"

  # attach the security group to the specific vpc, required value
  vpc_id = module.vpc.vpc_id

  # create the tags
  tags = {
    Name        = "${local.tag_name}-pfsense_lan"
    environment = var.environment
	cloudregion = var.cloudregion
    terraform   = "true"
  }

  dynamic "ingress" {
    for_each = local.pfsense_lan
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

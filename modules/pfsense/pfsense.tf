
locals {
   # LAN and WAN address always hardcoded
   pfsense_ip_wan    = "${var.vpc_net}.0.100"
   pfsense_ip_lan    = "${var.vpc_net}.128.100"
}

resource "aws_network_interface" "pfsense_lan" {
  description = "${local.tag_name}-pfsense lan interface"

  subnet_id         = module.vpc.private_subnets[0]
  security_groups   = [aws_security_group.pfsense_lan.id]
  source_dest_check = "false"

  private_ips = [ local.pfsense_ip_lan ]

  tags = {
    Name        = "${local.tag_name}-pfsense-lan"
    environment = var.environment
	cloudregion	= var.cloudregion
    terraform   = "true"
  }
}

resource "aws_network_interface" "pfsense_wan" {
  description = "${local.tag_name}-pfsense wan interface"

  subnet_id         = module.vpc.public_subnets[0]
  security_groups   = [aws_security_group.pfsense_wan.id]

  private_ips        = [ local.pfsense_ip_wan ]
  ipv6_address_count = 1

  tags = {
    Name        = "${local.tag_name}-pfsense-wan"
    environment = var.environment
	cloudregion	= var.cloudregion
    terraform   = "true"
  }
}

resource "aws_instance" "pfsense" {
  ami                    = var.pfsense_ami
  instance_type          = var.pfense_instance_type
  get_password_data      = false

  key_name                = aws_key_pair.keypair.key_name
  disable_api_termination = false

  network_interface {
    network_interface_id  = aws_network_interface.pfsense_wan.id
    device_index          = 0
  }

  network_interface {
    network_interface_id  = aws_network_interface.pfsense_lan.id
    device_index          =  1
  }

  # hardcoded initial password
  user_data = "password=${var.pfsense_init_pass}"

  root_block_device {
    volume_type  = "gp2"
    volume_size  = var.pfsense_disk_size
    encrypted    = "true"
  }

  volume_tags = {
    Name        = "${local.tag_name}-pfsense"
    environment = var.environment
	cloudregion = var.cloudregion
    terraform   = "true"
  }

  tags = {
    Name        = "${local.tag_name}-pfsense"
    environment = var.environment
	cloudregion	= var.cloudregion
    terraform   = "true"
  }
}

resource "aws_eip" "pfsense" {
  network_interface = aws_instance.pfsense.primary_network_interface_id
  vpc               = true
  instance          = aws_instance.pfsense.id

  tags = {
    Name        = "${local.tag_name}-pfsense"
    environment = var.environment
	cloudregion	= var.cloudregion
    terraform   = "true"
  }

  lifecycle {
    prevent_destroy = true
  }
}

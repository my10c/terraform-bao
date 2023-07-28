
resource "aws_instance" "devops" {
  count                  = length(var.devops_instances)
  ami                    = var.devops_linux_ami
  instance_type          = var.devops_instance_type[count.index]
  vpc_security_group_ids = [aws_security_group.devops.id]

  key_name                = aws_key_pair.keypair.key_name
  disable_api_termination = false
  subnet_id               = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]

  associate_public_ip_address = false

  iam_instance_profile = aws_iam_instance_profile.devops.name

  user_data_base64 = var.user_data

  # root disk
  root_block_device {
    volume_size           = var.devops_root_volume_size
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  volume_tags = {
    Name        = "${local.tag_name}-${element(var.devops_instances, count.index)}"
    environment = var.environment
    terraform   = "true"
  }

  tags = {
    Name        = "${local.tag_name}-${element(var.devops_instances, count.index)}"
    environment = var.environment
    terraform   = "true"
  }
}


module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.vpc_azs
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_ipv6                     = true
  #assign_ipv6_address_on_creation = true
  private_subnet_assign_ipv6_address_on_creation = false
  public_subnet_assign_ipv6_address_on_creation  = true
  public_subnet_ipv6_prefixes                    = ["0", "1", "2", "4"]

  # do not set the tag Name, this will be done by the module so it get the appropriate labels
  tags = {
    terraform        = "true"
    environment      = local.environment
  }

  # tags required by k8s to launch services in the right subnets
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = true
    "teir"                            = "private"
  }

  public_subnet_tags = {
    "teir"  = "public"
  }
}

# add tag to the main routing table, can only be done via cli, stupid terraform
# Jul 2023 : need to check if this has changed
resource "null_resource" "tag-main-route" {
  provisioner "local-exec" {
    command = "aws --region ${local.curr_region} ec2 create-tags --resources ${module.vpc.vpc_main_route_table_id} --tags Key=Name,Value=${var.vpc_name}-main"

  }
  depends_on = [module.vpc]
}

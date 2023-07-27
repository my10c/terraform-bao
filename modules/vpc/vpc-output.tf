
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = var.vpc_name
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_public_subnets_cidr" {
  value = var.vpc_public_subnets
}

output "vpc_public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "vpc_private_subnets_cidr" {
  value = var.vpc_private_subnets
}

output "vpc_private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "vpc_private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "vpc_zone" {
  value = var.vpc_azs
}

output "vpc_private_cidr" {
  value = var.vpc_private_cidr
}

output "vpc_public_cidr" {
  value = var.vpc_public_cidr
}

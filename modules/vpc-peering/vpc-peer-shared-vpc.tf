
# - START VPC #0 -
# get VPC data
data "aws_vpc" "peer_0" {
  id = element(local.peer_to, 0)
}

data "aws_route_tables" "peer_0" {
  vpc_id = element(local.peer_to, 0)
}

# from VPC's main route to peer's main route
resource "aws_route" "peers_vpc_0" {
  depends_on                = [module.prod_vpc,aws_vpc_peering_connection.peers_vpc]
  route_table_id            = module.prod_vpc.vpc_main_route_table_id
  destination_cidr_block    = local.peer_to_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

# from VPC's subnets to peer's subnet, private subnets
resource "aws_route" "private_subnets_to_vpc_0" {
  depends_on                = [module.prod_vpc,aws_vpc_peering_connection.peers_vpc]
  count                     = length(module.prod_vpc.private_route_table_ids)
  route_table_id            = element(module.prod_vpc.private_route_table_ids, count.index)
  destination_cidr_block    = local.peer_to_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

# from VPC's subnets to peer's subnet, public subnets
resource "aws_route" "public_subnets_to_vpc_0" {
  depends_on                = [module.prod_vpc,aws_vpc_peering_connection.peers_vpc]
  count                     = length(module.prod_vpc.public_route_table_ids)
  route_table_id            = element(module.prod_vpc.public_route_table_ids, count.index)
  destination_cidr_block    = local.peer_to_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

# route from peer's subnets to VPC subnets, all subnets
resource "aws_route" "subnets_form_vpc_0" {
  depends_on                = [module.prod_vpc,aws_vpc_peering_connection.peers_vpc,data.aws_route_tables.selected]
  for_each                  = data.aws_route_tables.peer_0.ids
  route_table_id            = each.key
  destination_cidr_block    = local.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

# - END -


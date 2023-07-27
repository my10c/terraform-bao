
# route from peer's subnets to VPC subnets, all subnets
resource "aws_route" "subnets_form_vpc_0" {
  depends_on                = [module.vpc,aws_vpc_peering_connection.peers_vpc,data.aws_route_tables.selected]
  for_each                  = data.aws_route_tables.peer_0.ids
  route_table_id            = each.key
  destination_cidr_block    = local.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

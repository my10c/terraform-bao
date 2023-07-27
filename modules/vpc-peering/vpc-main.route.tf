
# from VPC's main route to peer's main route
resource "aws_route" "peers_vpc_0" {
  depends_on                = [module.vpc,aws_vpc_peering_connection.peers_vpc]
  route_table_id            = module.vpc.vpc_main_route_table_id
  destination_cidr_block    = local.peer_to_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

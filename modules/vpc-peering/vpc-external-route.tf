
# from VPC's subnets to peer's subnet, public subnets
resource "aws_route" "public_subnets_to_vpc_0" {
   depends_on                = [
     module.vpc,
     aws_vpc_peering_connection.peers_vpc
   ]

   count                     = length(module.vpc.public_route_table_ids)
   route_table_id            = element(module.vpc.public_route_table_ids, count.index)
   destination_cidr_block    = local.peer_to_cidr[0]
   vpc_peering_connection_id = aws_vpc_peering_connection.peers_vpc[0].id
}

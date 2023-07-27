
variable peer_to        {}
variable peer_to_region {}
variable peer_to_label  {}
variable peer_to_cidr   {}

locals {
  peer_to        = var.peer_to
  peer_to_region = var.peer_to_region
  peer_to_label  = var.peer_to_label
  peer_to_cidr   = var.peer_to_cidr
}

# get VPC data
data "aws_vpc" "peers" {
  count = length(local.peer_to) 
  id    = local.peer_to[count.index]
}

data "aws_route_tables" "peer" {
  count  = length(local.peer_to) 
  vpc_id = local.peer_to[count.index]
}

locals {
  route_array - flatten([
     
  ])
}

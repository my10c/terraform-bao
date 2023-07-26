
output "pfsense_ami" {
  value = var.pfsense_ami
}

output "pfense_instance_type" {
  value = var.pfense_instance_type
}

output "pfsense_disk_size" {
  value = var.pfsense_disk_size
}

output "pfsense_id" {
  value = aws_instance.pfsense.id
}

output "pfsense_wan_private_ip" {
  value = aws_network_interface.pfsense_wan.private_ips
}

output "pfsense_lan_private_ip" {
  value = aws_network_interface.pfsense_lan.private_ips
}

output "pfsense_wan_subnet_id" {
  value = aws_network_interface.pfsense_wan.subnet_id
}

output "pfsense_lan_subnet_id" {
  value = aws_network_interface.pfsense_lan.subnet_id
}

output "pfsense_wan_source_dest_check" {
  value = aws_network_interface.pfsense_wan.source_dest_check
}

output "pfsense_lan_source_dest_check" {
  value = aws_network_interface.pfsense_lan.source_dest_check
}

output "pfsense_lan_security_groups" {
  value = aws_network_interface.pfsense_lan.security_groups
}

output "pfsense_wan_security_groups" {
  value = aws_network_interface.pfsense_wan.security_groups
}

output "pfsense_wan_private_dns" {
  value = aws_network_interface.pfsense_wan.private_dns_name
}

output "pfsense_lan_private_dns" {
  value = aws_network_interface.pfsense_lan.private_dns_name
}

output "pfsense_wan_public_ip" {
  value = aws_instance.pfsense.public_ip
}

output "pfsense_wan_ipv6_addresses" {
  value = aws_instance.pfsense.ipv6_addresses
}

output "pfsense_wan_public_dns" {
  value = aws_instance.pfsense.public_dns
}

output "pfsense_key_name" {
  value = aws_instance.pfsense.key_name
}

output "pfsense_admin_ips" {
  value = var.pfsense_admin_ips
}

output "pfsense_vpn_udp_port" {
  value = var.pfsense_vpn_udp_port
}

output "pfsense_vpn_tcp_port" {
  value = var.pfsense_vpn_tcp_port
}

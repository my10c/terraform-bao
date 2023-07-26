# pfsense variables
variable "pfsense_ami" {
  description = "linux ami to be use"
  type        = string
}

variable "pfense_instance_type" {
  description = "aws instance type"
  type        = string
  default     = "t3a.small"
}

variable "pfsense_disk_size" {
  description = "partition size for /"
  type        = string
  default     = "64"
}

variable "pfsense_init_pass" {
  description = "initial pfsense password"
  type        = string
}

variable "pfsense_admin_ips" {
  description = "allowed ip addresses to access the admin ui"
  type        = list(string)
}

variable "pfsense_vpn_udp_port" {
  description = "vpn udp port"
  type        = string
}

variable "pfsense_vpn_tcp_port" {
  description = "vpn tcp port"
  type        = string
}

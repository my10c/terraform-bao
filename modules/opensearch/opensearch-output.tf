output "region" {
  value = local.aws_region
}

output "osearch_domainnames" {
  value = "elasticsearch clusters to be created"
}

output "osearch_custom_endpoint" {
  value = "enable of the use of custom endpoint"
}

output "osearch_custom_endpoint_name" {
  value = "name of endpoint if osearch_custom_endpoint is enabled"
}

output "osearch_custom_enpoint_cert" {
  value = "acm certificate to use if osearch_custom_endpoint is enabled"
}

output "osearch_version" {
  value = "version of elasticsearch to be installed"
}

output "osearch_compatibility_mode" {
  value = "enable the compatibility mode"
}

output "osearch_auto_tone" {
  value = "enable auto tune"
}

output "osearch_maintenance_window" {
  value = "enable maintenance window"
}

output "osearch_maintenance_window_duration" {
  value = "maintenance duration if maintenance window is enable"
}

output "osearch_maintenance_window_repeats" {
  value = "maintenance schedule if maintenance window is enable"
}

output "osearch_maintenance_window_day" {
  value = "maintenance day if maintenance window is enable"
}

output "osearch_maintenance_window_time" {
  value = "maintenance start time if maintenance window is enable"
}

output "osearch_availability_zones" {
  value = "2-AZ or 3-AZ deployment"
}

output "osearch_instance_count" {
  value = "set instance count for the nodes, should multiple of the set availability zones"
}

output "osearch_instance_type" {
  value = "instance type for the nodes"
}

output "osearch_storage_type" {
  value = "storage type"
}

output "osearch_volume_type" {
  value = "volume type"
}

output "osearch_volume_size" {
  value = "volume size in GB"
}

output "osearch_dedicated_master" {
  value = "set dedicated master"
}

output "osearch_dedicated_master_count" {
  value = "set dedicated master count if osearch_dedicated_master is set to true"
}

output "osearch_dedicated_master_type" {
  value = "instance type for masters if osearch_dedicated_master is set to true"
}

output "osearch_access" {
  value = "vpc or public accesss"
}

output "osearch_vpc" {
  value = "vpc id"
}

output "osearch_vpc_subnets" {
  value = "vpc the subnets to be use"
}

output "osearch_security_group" {
  value = "security group for the es cluster"
}

output "osearch_authentication" {
  value = "enable authentication"
}

output "osearch_master_user_name" {
  value = "master username if osearch_authentication is set to true"
}

output "osearch_master_user_password" {
  value = "master password if osearch_authentication is set to true"
}

output "osearch_enforce_https" {
  value = "enforce https connection"
}

output "osearch_encrypt_at_rest" {
  value = "encrypt the rest apis"
}

output "osearch_node_to_node_encryption" {
  value = "encrypt connection between the nodes"
}

# opensearch variables
variable "osearch_domainnames" {
  description = "elasticsearch clusters to be created"
  type        = list(string)
}

variable "osearch_custom_endpoint" {
  description = "enable of the use of custom endpoint"
  type        = list(string)
}

# should never be user since it require a cert and the
# domain is internal
variable "osearch_custom_endpoint_name" {
  description = "name of endpoint if osearch_custom_endpoint is enabled"
  type        = list(string)
}

variable "osearch_custom_enpoint_cert" {
  description = "acm certificate to use if osearch_custom_endpoint is enabled"
  type        = list(string)
}

variable "osearch_version" {
  description = "version of elasticsearch to be installed"
  type        = list(string)
}

variable "osearch_compatibility_mode" {
  description = "enable the compatibility mode"
  type        = list(string)
}

variable "osearch_auto_tone" {
  description = "enable auto tune"
  type        = list(string)
}

variable "osearch_maintenance_window" {
  description = "enable maintenance window"
  type        = list(string)
}

variable "osearch_maintenance_window_duration" {
  description = "maintenance duration if maintenance window is enable"
  type        = list(string)
}

variable "osearch_maintenance_window_repeats" {
  description = "maintenance schedule if maintenance window is enable"
  type        = list(string)
}

variable "osearch_maintenance_window_day" {
  description = "maintenance day if maintenance window is enable"
  type        = list(string)
}

variable "osearch_maintenance_window_time" {
  description = "maintenance start time if maintenance window is enable"
  type        = list(string)
}

variable "osearch_availability_zones" {
  description = "2-AZ or 3-AZ deployment"
  type        = list(string)
}

variable "osearch_instance_count" {
  description = "set instance count for the nodes, should multiple of the set availability zones"
  type        = list(string)
}

variable "osearch_instance_type" {
  description = "instance type for the nodes"
  type        = list(string)
}

variable "osearch_storage_type" {
  type        = list(string)
  description = "storage type"
  default     = ["EBS"]
}

variable "osearch_volume_type" {
  description = "volume type"
  type        = list(string)
  default     = ["SSD"]
}

variable "osearch_volume_size" {
  description = "volume size in GB"
  type        = list(string)
  default     = ["16"]
}

variable "osearch_dedicated_master" {
  description = "set dedicated master"
  type        = list(string)
}

variable "osearch_dedicated_master_count" {
  description = "set dedicated master count if osearch_dedicated_master is set to true"
  type        = list(string)
}

variable "osearch_dedicated_master_type" {
  description = "instance type for masters if osearch_dedicated_master is set to true"
  type        = list(string)
}

variable "osearch_access" {
  description = "vpc or public accesss"
  type        = list(string)
  default     = ["VPC"]
}

variable "osearch_vpc" {
  description = "vpc id"
  type        = list(string)
}

variable "osearch_vpc_subnets" {
  description = "vpc the subnets to be use"
  type        = list(list(string))
}

variable "osearch_security_group" {
  description = "security group for the es cluster"
  type        = list(string)
}

variable "osearch_authentication" {
  description = "enable authentication"
  type        = list(string)
}

variable "osearch_master_user_name" {
  description = "master username if osearch_authentication is set to true"
  type        = list(string)
}

variable "osearch_master_user_password" {
  description = "master password if osearch_authentication is set to true"
  type        = list(string)
}

# should be a json part of the cluster creation
# variable "osearch_access_policy" {
#   description = "access policy to the cluster"
#   type        = list(string)
# }


variable "osearch_enforce_https" {
  description = "enforce https connection"
  type        = list(string)
}

variable "osearch_encrypt_at_rest" {
  description = "encrypt the rest apis"
  type        = list(string)
}

variable "osearch_node_to_node_encryption" {
  description = "encrypt connection between the nodes"
  type        = list(string)
}

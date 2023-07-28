# devops variables
variable "devops_linux_ami" {
  description = "linux ami to be use"
  type        = string
}

variable "devops_instance_type" {
  description = "aws instance type"
  type        = list(string)
}

variable "devops_instances" {
  description = "name of the devops instances to be created"
  type        = list(string)
}

variable "devops_root_volume_size" {
  description = "partition size for /"
  type        = string
  default     = "32"
}

variable "devops_data_volume_size" {
  description = "partition size for /data"
  type        = string
  default     = "64"
}

# vpc variables
variable "vpc_name" {
  description = "name of the vpc"
  type        = string
}

variable "vpc_cidr"   {
  description = "the cidr of the vpc"
  type        = string
}

variable "vpc_net"   {
  description = "network base on the cidr"
  type        = string
}

variable "vpc_azs" {
  description = "name of the aws zones to be used in the vpc"
  type        = list(string)
}

variable "vpc_private_subnets"  {
  description = "the cidr of the private subnets"
  type        = list(string)
}

variable "vpc_public_subnets"  {
  description = "the cidr of the public subnets"
  type        = list(string)
}

variable "vpc_private_cidr" {
  description = "the cidr of the private subnets"
  type        = string
}

variable "vpc_public_cidr" {
  description = "the cidr of the publicprivate subnets"
  type        = string
}

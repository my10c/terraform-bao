# keypair variables
variable "keypair_name" {
  description = "name of the keypair"
  type        = string
}

variable "keypair_pub" {
  description = "values of the ssh public key"
  type        = string
}

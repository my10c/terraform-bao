
resource "aws_key_pair" "keypair" {
  key_name   = var.keypair_name
  public_key = var.keypair_pub

  tags = {
    Name        = var.keypair_name
    environment = var.environment
    terraform   = "true"
  }
}

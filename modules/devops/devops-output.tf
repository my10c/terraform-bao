
output "devops_linux_ami" {
  value = var.devops_linux_ami
}

output "devops_instance_type" {
  value = var.devops_instance_type
}

output "devops_instances" {
  value = var.devops_instances
}

output "devops_root_volume_size" {
  value = var.devops_root_volume_size
}

output "devops_data_volume_size" {
  value = var.devops_data_volume_size
}

output "instance_devops" {
  value = aws_instance.devops[*].id
}

output "instance_devops_private_ip" {
  value = aws_instance.devops[*].private_ip
}

output "instance_devops_private_dns" {
  value = aws_instance.devops[*].private_dns
}

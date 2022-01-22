output "server_id" {
  value = linode_instance.terraform.id
}
output "public_ip" {
  description = "Instance public address"
  value       = linode_instance.terraform.ip_address
}
output "private_ip" {
  value = linode_instance.terraform.private_ip_address
}
output "ipv6" {
  value = linode_instance.terraform.ipv6
}
output "root_pass" {
  value = random_string.instance_root_pass.result
}
output "server_name" {
  value = linode_instance.terraform.label
}
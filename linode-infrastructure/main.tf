# Configure the Linode Provider
provider "linode" {
  token = var.linode_token
}

resource "linode_sshkey" "main_key" {
  label = var.key_label
  #ssh_key = chomp(file(local.key))
  ssh_key = var.authorized_keys
}
data "linode_stackscript" "core_infracstructure" {
  id = var.stackscript_id
}
# Start a linode server
#resource "module name" "linode_id"
resource "linode_instance" "terraform" {
  image           = var.image
  label           = var.instance_name
  region          = var.region
  type            = var.type
  authorized_keys = [linode_sshkey.main_key.ssh_key]
  root_pass       = random_string.instance_root_pass.result
  private_ip      = var.private_ip
  tags            = var.tags
  backups_enabled = var.backups
}


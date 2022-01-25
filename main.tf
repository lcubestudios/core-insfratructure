# Configure the Linode Provider
provider "linode" {
  token = var.linode_token
}

# Start a linode server
#resource "module name" "linode_id"
resource "linode_instance" "terraform" {
  image           = var.image
  label           = var.instance_name
  region          = var.region
  type            = var.type
  authorized_keys = [var.authorized_keys]
  root_pass       = random_string.instance_root_pass.result
  private_ip      = var.private_ip
  tags            = var.tags
  backups_enabled = var.backups
  stackscript_id = linode_stackscript.core_pkgs.id
}


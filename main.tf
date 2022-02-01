# Configure the Linode Provider
provider "linode" {
  token = var.linode_token
}

#Add local ssh key
resource "linode_sshkey" "local_key" {
  label   = var.key_label
  ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
  #ssh_key = var.authorized_keys
}

#Load ssh keys from linode
data "linode_sshkey" "skynet" {
  label = "skynet"
}
data "linode_sshkey" "kira" {
  label = "kira"
}
data "linode_sshkey" "jenkins" {
  label = "jenkins"
}
#Load stackscript from linode
data "linode_stackscript" "core-package" {
  id = var.stackscript_id
}

# Start a linode server
resource "linode_instance" "terraform" {
  image  = var.image
  label  = var.instance_name
  region = var.region
  type   = var.type
  #authorized_keys = [linode_sshkey.main_key.ssh_key]
  authorized_keys = [data.linode_sshkey.skynet.ssh_key, data.linode_sshkey.kira.ssh_key, data.linode_sshkey.jenkins.ssh_key, linode_sshkey.local_key.ssh_key]
  root_pass       = random_string.instance_root_pass.result
  private_ip      = var.private_ip
  tags            = var.tags
  backups_enabled = var.backup
  #stackscript_id = linode_stackscript.core_pkgs.id.script
  stackscript_id   = data.linode_stackscript.core-package.id
  #stackscript_data = data.linode_stackscript.core-package.script
}


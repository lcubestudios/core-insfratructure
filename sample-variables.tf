#--------------API DOCUMENTANTION------------#
#------- https://www.linode.com/docs/api/ ---#
#--------------API DOCUMENTANTION------------#
variable "linode_token" {
  #https://cloud.linode.com/profile/tokens
  description = "Linode API Personal Access Token"
  #value = 
  default = "Your Token"
}
variable "image" {
  #https://api.linode.com/v4/images/
  description = "Image to use for Linode instance"
  #value = 
  default = "linode/ubuntu20.04" #change to desire ubuntu image
}
variable "region" {
  #https://api.linode.com/v4/regions/
  description = "The region where your Linode will be located."
  #value = 
  default = "us-east" # change to desire region
}
variable "type" {
  #https://api.linode.com/v4/linode/types
  #USE INSTANCE ID 
  description = "Instance size / Your Linode's plan type."
  #value = 
  default = "g6-standard-2" #change to your desire server size
}
variable "instance_name" {
  #https://api.linode.com/v4/tags
  description = "The Linode's label is for display purposes only."
  #value = 
  default = "lcubes-demo-server"
}
variable "key_label" {
  description = "Key name"
  #value = 
  default = "Your COMPUTER NAME"
}
variable "authorized_keys" {
  #https://api.linode.com/v4/account/users
  #https://api.linode.com/v4/profile/sshkeys
  description = "Your local ssh key"
  #value = 
  default = "chomp(file(~/.ssh/id_rsa.pub))"
}

variable "tags" {
  #labels could be region, type of server & domain name 
  description = "Group Label"
  #value = 
  default = ["US-East", "Web Server", "Demo Server"]
}
resource "random_string" "instance_root_pass" {
  #Create a random root password
  length  = 32
  special = true
}
variable "private_ip" {
  description = "Enable / Disable Instance Private IP"
  type        = bool
  #value = 
  default = true
}

variable "public_ip" {
  description = "Enable / Disable IPV4"
  type        = bool
  #value = 
  default = true
}
variable "backup" {
  description = "Enable / Disable IPV4"
  type        = bool
  #value = 
  default = false
}

resource "linode_stackscript" "sample" {
  label = "sample"
  description = "Updates OS, Installs Snap & Docker"
  script = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release snap -y
sudo snap install core; sudo snap refresh core
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
EOF
  images = ["linode/ubuntu20.04"]
  rev_note = "initial version"
}
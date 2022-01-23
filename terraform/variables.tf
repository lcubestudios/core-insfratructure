#--------------API DOCUMENTANTION------------#
#------- https://www.linode.com/docs/api/ ---#
#--------------API DOCUMENTANTION------------#
variable "linode_token" {
  #https://cloud.linode.com/profile/tokens
  description = "Linode API Personal Access Token"
  #value = 
  default = "d23cb95659c6115e06a09d96fe7a3b63a7df2ce7ed66283e0a6fdd00e69b396d"
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
  description = "Public Key"
  #value = 
  default = "cloudninja"
}
variable "authorized_keys" {
  #https://api.linode.com/v4/account/users
  #https://api.linode.com/v4/profile/sshkeys
  description = "Get SSH key ID or paste SSH key"
  #value = 
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUZkTssxTl5GgX4LSxSBHh+flyTA2nHirl64HDh1rkPmd4DHI/+Yhy3UzepPrBbIMIfEZRNJybaXPpcQhS+2ehjZiSwvkuGrgkDcRi1h+96PZULp2tmGk/nk9GM2y9YEZLsuIcdXqdD8kj0LpcI2k1l7BfeeKUoW3TnPJk8jxVF45F5AlObJTYpFdQEOsgJZcL/1jPMcYqAVrGtxFRpfVrzGLSJBOXsBYulEO3p1kyJtIWRTdpWHqNMULRHYyvwjnXCBX24eGnRAgMTTQJ7HPmvD8PIW/9oNDPLMkkiPp1V6OrTxARqjwPbuxGkMF0oKTDgMf6ahW5u5uHJtjDuTh7 cloudninja@CloudNinja"
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
variable "backups" {
  description = "Enable / Disable IPV4"
  type        = bool
  #value = 
  default = false
}

variable "stackscript_id" {
  type    = number
  default = 964449
}
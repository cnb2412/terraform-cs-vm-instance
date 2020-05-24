# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

resource "cloudstack_instance" "this" {
  count            = var.instance_count
  display_name     = var.name
  name             = var.name
  template         = var.template
  service_offering = var.serviceoffering
  keypair          = var.sshkey_name
  user_data        = var.user_data
  zone             = var.zone
  network_id       = var.network_id
  root_disk_size   = var.root_disk_size
  expunge          = true
}

resource "cloudstack_ipaddress" "this-ips" {
  count      = var.instance_count
  network_id = var.network_id
  zone       = var.zone
  vpc_id     = var.vpc_id
}

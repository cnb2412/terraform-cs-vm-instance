# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.13 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.13"
}

resource "cloudstack_instance" "this" {
  count            = var.instance_count
  display_name     = var.instance_count <= 1 ? var.name : "${var.name}-${count.index}
  name             = var.instance_count <= 1 ? var.name : "${var.name}-${count.index}"
  template         = var.template
  service_offering = var.serviceoffering
  keypair          = var.sshkey_name
  user_data        = var.user_data
  zone             = var.zone
  network_id       = var.network_id
  root_disk_size   = var.root_disk_size
  expunge          = true
}

resource "cloudstack_disk" "this-disk" {
  count              = var.instance_count * var.data_disks
  name               = "${var.name}-${floor(count.index / var.data_disks)}-disk-${count.index % var.data_disks}"
  disk_offering      = var.disk_offering
  zone               = var.zone
  attach             = true
  size               = var.disk_sizes[count.index % var.data_disks]
  virtual_machine_id = cloudstack_instance.this[floor(count.index / var.data_disks)].id
}

resource "cloudstack_ipaddress" "this-ips" {
  count      = var.instance_count
  network_id = var.network_id
  zone       = var.zone
  vpc_id     = var.vpc_id
}

resource "cloudstack_static_nat" "default" {
  count              = var.instance_count
  ip_address_id      = cloudstack_ipaddress.this-ips[count.index].id
  virtual_machine_id = cloudstack_instance.this[count.index].id
}

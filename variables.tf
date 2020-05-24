# --------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters needs to be configured
# --------------------------------------------------------------------------

variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "template" {
  description = "ID or name of the template to use"
  type        = string
}

variable "serviceoffering" {
  description = "The type of instance to start"
  type        = string
}

variable "zone" {
  description = "Name or ID of the zone where the VPC should be deployed"
  type        = string
}

variable "network_id" {
  description = "The ID of the network to connect this instance to. Changing this forces a new resource to be created."
  type        = string
}

# --------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable "sshkey_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}

variable "root_disk_size" {
  description = "The size of the root disk in gigabytes."
  type        = number
  default     = 0
}

variable "assign_public_ip" {
  default     = false
  description = "Assign a public IP via static NAT."
  type        = bool
}

variable "vpc_id" {
  description = "The ID of the VPC. Required if assign_public_ip is true"
  type        = string
  default     = ""
}


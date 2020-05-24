# Cloudstack Instance (VM) Terraform module

Terraform module which creates instances (VMs) in CloudStack environments

These types of resources are supported:

* [CS instance](https://www.terraform.io/docs/providers/cloudstack/r/instance.html)

## Usage

```hcl
module "cs_instance_cluster" {
  # required parameters
  source           = "github.com/cnb2412/terraform-cs-vm-instance"
  name             = "my-cluster"
  instance_count   = 5
  template         = "CentOS 6.5"
  network_id       = "6eb22f91-7454-4107-89f4-36afcdf33021"
  zone             = "Zone-1"
  serviceoffering  = "small"

  
  # optional parameter
  keypair          = "my-ssh-key"
  root_disk_size   = 30
}
```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| cloudstack | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance\_count | Number of instances to launch | `number` | `1` | no |
| name | Name to be used on all resources as prefix | `string` | n/a | yes |
| network\_id | The ID of the network to connect this instance to. Changing this forces a new resource to be created. | `string` | `""` | no |
| root\_disk\_size | The size of the root disk in gigabytes. | `number` | `0` | no |
| serviceoffering | The type of instance to start | `string` | n/a | yes |
| sshkey\_name | The key name to use for the instance | `string` | `""` | no |
| template | ID or name of the template to use | `string` | n/a | yes |
| user\_data | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `string` | `null` | no |
| zone | Name or ID of the zone where the VPC should be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| display\_name | List of display names of instances |
| id | List of IDs of instances |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

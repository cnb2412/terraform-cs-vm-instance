# Apache Cloudstack Instance (VM) Terraform module

Terraform module which creates instances (VMs) in CloudStack environments

These types of resources are supported:

* [CS instance](https://www.terraform.io/docs/providers/cloudstack/r/instance.html)
* [CS ipaddress](https://www.terraform.io/docs/providers/cloudstack/r/ipaddress.html)
* [CS static NAT](https://www.terraform.io/docs/providers/cloudstack/r/static_nat.html)
* [CS disk](https://www.terraform.io/docs/providers/cloudstack/r/disk.html)

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
  assign_public_ip = true
  data_disks = 2
  disk_offering = "my-disk-offering"
  disk_sizes  = [100,200]
  
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
| assign\_public\_ip | Assign a public IP via static NAT. | `bool` | `false` | no |
| data\_disks | Number of additional data disks. | `number` | `0` | no |
| disk\_offering | Disk offering that should be used. | `string` | `""` | no |
| disk\_sizes | Sizes of data disks. | `list(number)` | `[]` | no |
| instance\_count | Number of instances to launch | `number` | `1` | no |
| name | Name to be used on all resources as prefix | `string` | n/a | yes |
| network\_id | The ID of the network to connect this instance to. Changing this forces a new resource to be created. | `string` | n/a | yes |
| root\_disk\_size | The size of the root disk in gigabytes. | `number` | `0` | no |
| serviceoffering | The type of instance to start | `string` | n/a | yes |
| sshkey\_name | The key name to use for the instance | `string` | `""` | no |
| template | ID or name of the template to use | `string` | n/a | yes |
| user\_data | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `string` | `null` | no |
| vpc\_id | The ID of the VPC. Required if assign\_public\_ip is true | `string` | `""` | no |
| zone | Name or ID of the zone where the VPC should be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| display\_name | List of display names of instances |
| id | List of IDs of instances |
| public\_ip | List of public IP addresses assigned to VMs |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

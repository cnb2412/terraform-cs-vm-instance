output "id" {
  description = "List of IDs of instances"
  value       = cloudstack_instance.this.*.id
}

output "display_name" {
  description = "List of display names of instances"
  value       = cloudstack_instance.this.*.display_name
}
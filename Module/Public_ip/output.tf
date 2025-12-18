output "public_ip_ids" {
  description = "IDs of created Public IPs"
  value       = { for k, v in azurerm_public_ip.this : k => v.id }
}

output "public_ip_addresses" {
  description = "Public IP addresses"
  value       = { for k, v in azurerm_public_ip.this : k => v.ip_address }
}

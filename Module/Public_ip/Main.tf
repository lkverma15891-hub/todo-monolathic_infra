resource "azurerm_public_ip" "this" {
  for_each = var.public_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  zones                   = try(each.value.zones, null)
  ddos_protection_mode    = try(each.value.ddos_protection_mode, null)
  ddos_protection_plan_id = try(each.value.ddos_protection_plan_id, null)
  domain_name_label       = try(each.value.domain_name_label, null)
  domain_name_label_scope = try(each.value.domain_name_label_scope, null)
  edge_zone               = try(each.value.edge_zone, null)
  idle_timeout_in_minutes = try(each.value.idle_timeout_in_minutes, null)
  ip_tags                 = try(each.value.ip_tags, null)
  ip_version              = try(each.value.ip_version, null)
  public_ip_prefix_id     = try(each.value.public_ip_prefix_id, null)
  reverse_fqdn            = try(each.value.reverse_fqdn, null)

  sku = try(each.value.sku, "Standard")
  sku_tier = try(each.value.sku_tier, "Regional")
  tags = try(each.value.tags, {})
}

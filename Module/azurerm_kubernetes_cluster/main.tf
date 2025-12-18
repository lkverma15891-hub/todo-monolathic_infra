resource "azurerm_kubernetes_cluster" "aks" {
for_each = var.aks_clusters


name = each.value.name
dns_prefix = each.value.dns_prefix
location = azurerm_resource_group.rg[each.value.resource_group_key].location
resource_group_name = azurerm_resource_group.rg[each.value.resource_group_key].name


dynamic "default_node_pool" {
for_each = [each.value.default_node_pool]
content {
name = default_node_pool.value.name
node_count = default_node_pool.value.node_count
vm_size = default_node_pool.value.vm_size
}
}


dynamic "identity" {
for_each = [each.value.identity_type]
content {
type = identity.value
}
}


tags = each.value.tags
}
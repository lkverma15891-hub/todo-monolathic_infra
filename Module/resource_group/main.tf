
# Resource Group creation using for_each
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location

  tags = merge(
    {
      Environment = each.value.environment
    },
    each.value.tags
  )
}

# Output to display created resource group names
output "resource_group_names" {
  value = { for key, rg in azurerm_resource_group.rg : key => rg.name }
}
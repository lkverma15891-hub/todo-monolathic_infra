# Get current Azure client details
data "azurerm_client_config" "current" {}

# Loop ke saath Key Vault create
resource "azurerm_key_vault" "example" {
  for_each                    = var.key_vaults
  name                        = each.key
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions     = ["Get"]
    secret_permissions  = ["Get" , "List"]
    storage_permissions = ["Get"]
  }
}

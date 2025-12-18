variable "key_vaults" {
  type = map(object({
    resource_group_name        = string
    location                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
  }))
}

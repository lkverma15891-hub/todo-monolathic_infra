# variables.tf

variable "storage_accounts" {
  description = "Map of storage accounts to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    environment              = string
    access_tier              = optional(string)
    tags                     = optional(map(string))
  }))
}

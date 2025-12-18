variable "rg" {
  type = map(object({
    name        = string
    location    = string
    managed_by  = string
    environment = string
    tags        = map(string)
  }))

}

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


variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

    subnets = optional(map(object({
      name = string
      cidr = list(string)
    })))
  }))
}

variable "key_vaults" {
  type = map(object({
    resource_group_name        = string
    location                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
  }))
}
variable "sql_server" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string

  }))

}

variable "vms" {
  type = map(object(
    {
      nic_name       = string
      location       = string
      rg_name        = string
      vnet_name      = string
      subnet_name    = string
      pip_name       = string
      vm_name        = string
      size           = string
      admin_username = string
      admin_password = string

      source_image_reference = map(string)


  }))

}

variable "public_ips" {
  description = "Map of Public IP configurations"
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    allocation_method       = string # Static or Dynamic
    zones                   = optional(list(string))
    ddos_protection_mode    = optional(string)
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number)
    ip_tags                 = optional(map(string))
    ip_version              = optional(string)
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    sku                     = optional(string)
    sku_tier                = optional(string)
    tags                    = optional(map(string))
  }))
}

variable "infraaks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    node_pools = list(object({
      name       = string
      node_count = number
      vm_size    = string
    }))

  }))
}




# variable "cdn" {
#   description = "Map of CDN profiles"
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     sku                 = string
#   }))
# }

# variable "cdn_endpoint" {
#   description = "Map of CDN endpoints"
#   type = map(object({
#     name                = string
#     profile_name        = string
#     location            = string
#     resource_group_name = string
#   }))
# }


variable "aks_clusters" {
  
  type = map(object({
    name               = string
    dns_prefix         = string
    resource_group_key = string
    identity_type      = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    tags = map(string)
  }))
}

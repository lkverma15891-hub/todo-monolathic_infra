
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

variable "resource_groups" {
    type = map(object({
      name        = string
      location    = string
      environment = string
      tags        = optional(map(string))
    }))
  
}
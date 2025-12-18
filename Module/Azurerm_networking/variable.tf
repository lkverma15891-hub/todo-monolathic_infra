# variable "networks" {
#   type = map(object(
#     {
#     name                 = string
#     location             = string
#     resource_group_name  = string
#     cidr                 = list(string)

#     subnets = map(object(
#      {
#         name = string
#         cidr = list(string)
#       }

#     ))
#   }
#   )) 
# }


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

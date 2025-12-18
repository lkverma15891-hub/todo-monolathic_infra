module "resource_group" {
 source = "../../modules/azurerm_resource_group" 
 rgs    = var.rgs
}

# module "container_registory" {
#     depends_on = [ module.resource_group ]
#     source = "../../Module/Azurerm_contaoner_registory"
  
# }


# module "data_factory" {
#   source = "../../Module/azurerm_data_factory"
# }


# module "kubernates_cluster" {
#     depends_on = [ module.resource_group ]
#     source = "../.../Module/AKS"
  
# }

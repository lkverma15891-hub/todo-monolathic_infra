module "resource_group" {
  source          = "../../Module/resource_group"
  resource_groups = var.rg
}

module "network" {
  source   = "../../Module/Azurerm_networking"
  networks = var.networks
}

module "storage_account" {
  source           = "../../Module/storage_account"
  storage_accounts = var.storage_accounts
}

module "public_ip" {
  source     = "../../Module/Public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  source     = "../../Module/Key_Volt"
  key_vaults = var.key_vaults
}

module "sql_server" {
  source     = "../../Module/Azurerm_sql_server"
  sql_server = var.sql_server
}

module "azurerm_linux_virtual_machine" {
  source = "../../Module/Azurerm_linux_vm"
  vms    = var.vms
}

module "azurerm_kubernetes_cluster" {
  source = "../../Module/azurerm_kubernetes_cluster"

  aks_clusters = var.aks_clusters
}


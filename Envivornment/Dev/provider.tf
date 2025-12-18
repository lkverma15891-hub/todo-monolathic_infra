terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "infra_rg"
    storage_account_name = "lovedevstorage01"
    container_name       = "tfstates"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f528f9c3-ba1f-462f-a320-9ea3c9a1df31"
  tenant_id       = "d338749b-64ea-4a23-a656-91a484ece1dc"
}

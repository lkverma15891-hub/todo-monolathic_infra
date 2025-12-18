rg = {
  rg1 = {
    name        = "infra_rg"
    location    = "centralIndia"
    managed_by  = "Terraform"
    environment = "dev"
    tags = {
      env = "dev"

    }
  }
}


networks = {
  v1 = {
    name                = "vnet-Ran"
    location            = "centralIndia"
    resource_group_name = "infra_rg"
    address_space       = ["10.1.0.0/16"]

    subnets = {
      s1 = {
        name = "frontend-subnet"
        cidr = ["10.0.1.0/24"]
      }
      s2 = {
        name = "backend-subnet"
        cidr = ["10.0.2.0/24"]
      }
    }
  }

}


vms = {
  vm1 = {
    nic_name       = "nic_frontend"
    location       = "Central India"
    rg_name        = "infra_rg"
    vnet_name      = "vnet-Ran"
    subnet_name    = "frontend-subnet"
    pip_name       = "Frontend_pip"
    vm_name        = "frontend-vm"
    size           = "Standard_B2s"
    admin_username = "azureuser"
    admin_password = "Love@12345"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    location       = "centralIndia"
    nic_name       = "nic_backend"
    rg_name        = "infra_rg"
    vnet_name      = "vnet-Ran"
    subnet_name    = "backend-subnet"
    pip_name       = "backend-pip"
    vm_name        = "backend-vm"
    size           = "Standard_B1s"
    admin_username = "azureuser"
    admin_password = "Love@12345"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

# terraform.tfvars

storage_accounts = {
  sa1 = {
    name                     = "lovedevstorage01"
    resource_group_name      = "infra_rg"
    location                 = "centralIndia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    environment              = "dev"
    tags = {
      Owner   = "Loveneesh"
      Project = "App1"
    }
  }

  sa2 = {
    name                     = "loveprodstorage01"
    resource_group_name      = "infra_rg"
    location                 = "centralIndia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    environment              = "prod"
    tags = {
      Owner   = "Loveneesh"
      Project = "App2"
    }
  }
}

public_ips = {
  backend = {
    name                = "pip-westus"
    resource_group_name = "infra_rg"
    location            = "centralIndia"
    allocation_method   = "Static" # ✅ Standard SKU requires Static
    sku                 = "Standard"
    sku_tier            = "Regional"
    tags = {
      environment = "dev"
      owner       = "loveneesh"
    }
  }
}
key_vaults = {
  kv1-love = {
    resource_group_name        = "infra_rg"
    location                   = "Central India"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
  }
}

sql_server = {
  sql_1 = {
    name                         = "infra-server"
    location                     = "centralindia"
    resource_group_name          = "infra_rg"
    version                      = "12.0"
    administrator_login          = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  }
}


resource "azurerm_mssql_server" "Infra-db" {

  for_each                     = var.sql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

}



#  administrator_login          = "4dm1n157r470r"
#   administrator_login_password = "4-v3ry-53cr37-p455w0rd"
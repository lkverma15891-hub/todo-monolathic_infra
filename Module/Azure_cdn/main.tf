resource "azurerm_cdn_profile" "this" {
  for_each            = var.cdn
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
}

resource "azurerm_cdn_endpoint" "example" {
  for_each =  var.cdn_endpoint
  name                = each.value.name
  profile_name        = each.value.profile_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  origin {
    name      = "infra"
    host_name = "www.contoso.com"
  }
}
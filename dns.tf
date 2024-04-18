resource "azurerm_dns_zone" "public" {
  count = var.enable_public_dns ? 1 : 0
  name                = var.public_root_domain
  resource_group_name       = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone" "internal" {
  count = var.enable_public_dns ? 1 : 0

  name                = var.internal_root_domain
  resource_group_name       = data.azurerm_resource_group.rg.name
}

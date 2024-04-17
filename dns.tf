resource "azurerm_private_dns_zone" "internal" {
  name                = var.internal_root_domain
  resource_group_name = data.azurerm_resource_group.rg.name
}

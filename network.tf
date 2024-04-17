locals {}

data "azurerm_virtual_network" "network" {
  name                = var.network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.network.name
  resource_group_name  = data.azurerm_virtual_network.network.resource_group_name
}

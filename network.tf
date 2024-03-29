locals {
  // we create a network with two address spaces - one for node pool subnets and one for services, gateways etc.
  address_spaces = ["10.0.0.0/16", "10.2.0.0/16"]
  // node pool subnets
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names = ["a", "b", "c"]

  // app and services
  appgw_cidr     = "10.2.0.0/24"
  service_cidr   = "10.2.1.0/24"
  dns_service_ip = "10.2.1.10"
}

data "azurerm_virtual_network" "network" {
  name                = var.network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.network.name
  resource_group_name  = data.azurerm_virtual_network.network.resource_group_name
}
